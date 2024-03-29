package io.github.lancelothuxi.mock.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaMode;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.github.yitter.idgen.YitIdHelper;
import io.github.lancelothuxi.mock.system.dto.dict.DictQuery;
import io.github.lancelothuxi.mock.system.entity.DictionaryEntity;
import io.github.lancelothuxi.mock.system.service.IDictionaryService;
import lombok.AllArgsConstructor;
import io.github.lancelothuxi.mock.constant.CommonConst;
import io.github.lancelothuxi.mock.dto.IdsModel;
import io.github.lancelothuxi.mock.dto.PageResult;
import io.github.lancelothuxi.mock.utils.CommonResult;
import io.github.lancelothuxi.mock.utils.RedisUtil;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 数据字典管理
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
@RestController
@AllArgsConstructor
@RequestMapping("/center/system/dict")
public class DictController {
    private final IDictionaryService dictionaryService;
    private final RedisUtil redisUtil;

    @GetMapping("list")
    @SaCheckPermission(value = {"system:dict:query"}, mode = SaMode.OR)
    public PageResult<DictionaryEntity> list(DictQuery query) {
        List<DictionaryEntity> list = dictionaryService.list(query);
        PageResult<DictionaryEntity> pageResult = new PageResult<>(list);
        pageResult.setTotal(query.getTotal());
        return pageResult;
    }

    @GetMapping("list1")
    @SaCheckPermission(value = {"system:dict:query"}, mode = SaMode.OR)
    public List<DictionaryEntity> list1(DictionaryEntity dictionaryEntity) {
        LambdaQueryWrapper<DictionaryEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(DictionaryEntity::getCode, dictionaryEntity.getCode());
        queryWrapper.eq(DictionaryEntity::getValue, "#");
        queryWrapper.ne(DictionaryEntity::getId, dictionaryEntity.getId());
        return dictionaryService.list(queryWrapper);
    }

    @GetMapping("values")
    @SaCheckPermission(value = {"system:dict:query"}, mode = SaMode.OR)
    public List<DictionaryEntity> listValues(@RequestParam("code") String code) {
        //先从缓存中拿
        Object data = redisUtil.get(code);
        if (ObjectUtil.isNotNull(data)) {
            List<DictionaryEntity> list = JSONUtil.toList(data.toString(), DictionaryEntity.class);
            return list;
        }
        LambdaQueryWrapper<DictionaryEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(DictionaryEntity::getCode, code);
        queryWrapper.notIn(DictionaryEntity::getValue, "#");
        return dictionaryService.list(queryWrapper);
    }

    @GetMapping("values/{code}")
    public List<DictionaryEntity> listValues1(@PathVariable("code") String code) {
        //先从缓存中拿
        Object data = redisUtil.get(code);
        if (ObjectUtil.isNotNull(data)) {
            List<DictionaryEntity> list = JSONUtil.toList(data.toString(), DictionaryEntity.class);
            return list;
        }
        LambdaQueryWrapper<DictionaryEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(DictionaryEntity::getCode, code);
        queryWrapper.notIn(DictionaryEntity::getValue, "#");
        return dictionaryService.list(queryWrapper);
    }

    @PostMapping("addDict")
    @SaCheckPermission(value = {"system:dict:add"}, mode = SaMode.OR)
    public CommonResult addDict(@RequestBody DictionaryEntity dictionaryEntity) {
        dictionaryEntity.setId(String.valueOf(YitIdHelper.nextId()));
        dictionaryService.save(dictionaryEntity);
        this.refDictCache();
        return CommonResult.success();
    }

    @PostMapping("editDict")
    @SaCheckPermission(value = {"system:dict:edit"}, mode = SaMode.OR)
    public CommonResult editDict(@RequestBody DictionaryEntity dictionaryEntity) {
        //清洗对象
        DictionaryEntity d = dictionaryService.getById(dictionaryEntity.getId());
        if (CommonConst.ALARM_SIGNAL.equals(d.getValue())) {
            DictionaryEntity d1 = new DictionaryEntity();
            d1.setCode(d.getCode());
            List<DictionaryEntity> list = dictionaryService.
                    list(Wrappers.query(d1));
            if (CollectionUtil.isNotEmpty(list)) {
                list.forEach(dict -> {
                    dict.setCode(dictionaryEntity.getCode());
                    dictionaryService.updateById(dict);
                });
            }
            d.setLabel(dictionaryEntity.getLabel());
            d.setCode(dictionaryEntity.getCode());
        } else {
            d.setLabel(dictionaryEntity.getLabel());
            d.setValue(dictionaryEntity.getValue());
        }
        dictionaryService.updateById(d);
        this.refDictCache();
        return CommonResult.success();
    }

    @PostMapping("delDict")
    @SaCheckPermission(value = {"system:dict:del"}, mode = SaMode.OR)
    public CommonResult delDict(@RequestBody IdsModel model) {
        DictionaryEntity d = dictionaryService.getById(model.getId());
        if (CommonConst.ALARM_SIGNAL.equals(d.getValue())) {
            DictionaryEntity dic = new DictionaryEntity();
            dic.setCode(d.getCode());
            dictionaryService.remove(Wrappers.query(dic));
        } else {
            dictionaryService.removeById(model.getId());
        }
        this.refDictCache();
        return CommonResult.success();
    }

    @GetMapping("refDictCache")
    @SaCheckPermission(value = {"system:dict:query"}, mode = SaMode.OR)
    public CommonResult refDictCache() {
        DictionaryEntity dictionaryEntity = new DictionaryEntity();
        dictionaryEntity.setValue("#");
        List<DictionaryEntity> dictionaryEntityList = dictionaryService.list(Wrappers.query(dictionaryEntity));
        if (dictionaryEntityList.size() != 0) {
            for (DictionaryEntity item : dictionaryEntityList) {
                DictionaryEntity d = new DictionaryEntity();
                d.setCode(item.getCode());
                List<DictionaryEntity> list =
                        dictionaryService.list(Wrappers.query(d).notIn("value", "#"));
                JSONArray array = new JSONArray();
                if (list.size() != 0) {
                    for (DictionaryEntity item1 : list) {
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("value", item1.getValue());
                        jsonObject.put("id", item1.getId());
                        jsonObject.put("label", item1.getLabel());
                        jsonObject.put("code", item1.getCode());
                        array.add(jsonObject);
                    }
                }
                redisUtil.set(item.getCode(), String.valueOf(array));
            }
        }
        return CommonResult.success();
    }
}
