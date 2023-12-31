package io.github.lancelothuxi.mock.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.yitter.idgen.YitIdHelper;
import io.github.lancelothuxi.mock.system.dto.fieldarea.FieldAreaDetailFormVO;
import io.github.lancelothuxi.mock.system.dto.fieldarea.FieldAreaFormVO;
import io.github.lancelothuxi.mock.system.entity.FieldAreaDetailEntity;
import io.github.lancelothuxi.mock.system.entity.FieldAreaEntity;
import io.github.lancelothuxi.mock.system.mapper.FieldAreaMapper;
import io.github.lancelothuxi.mock.system.service.IFieldAreaDetailService;
import io.github.lancelothuxi.mock.system.service.IFieldAreaService;
import lombok.RequiredArgsConstructor;
import io.github.lancelothuxi.mock.constant.CommonConst;
import io.github.lancelothuxi.mock.dto.IdsModel;
import io.github.lancelothuxi.mock.dto.PageModel;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * 数据域主表;(s_d_field_area)表服务实现类
 *
 * @author ThePai
 * @version v1.0
 * @since 2022/8/7
 */
@Service
@DS(CommonConst.DB_BASE)
@RequiredArgsConstructor
public class FieldAreaServiceImpl extends ServiceImpl<FieldAreaMapper, FieldAreaEntity> implements IFieldAreaService {
    private final IFieldAreaDetailService fieldAreaDetailService;

    /**
     * 查询列表
     *
     * @return 列表数据
     */
    @Override
    public List<FieldAreaEntity> list(PageModel pageModel) {
        QueryWrapper<FieldAreaEntity> queryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(pageModel.getSearchValue())) {
            queryWrapper.lambda().like(FieldAreaEntity::getName, pageModel.getSearchValue()).or().like(FieldAreaEntity::getCode, pageModel.getSearchValue());
        }
        if (StrUtil.isEmpty(pageModel.getSortField())) {
            queryWrapper.lambda().orderByDesc(FieldAreaEntity::getCreateTime);
        }
        Page<FieldAreaEntity> page = new Page<>(pageModel.getCurrent(), pageModel.getPageSize());
        IPage<FieldAreaEntity> iPage = this.page(page, queryWrapper);
        return pageModel.setList(iPage.getRecords(), page.getTotal());
    }

    /**
     * 新增
     *
     * @param id 主键id
     * @return 是否成功
     */
    @Override
    public FieldAreaFormVO info(String id) {
        FieldAreaEntity entity = this.getById(id);
        FieldAreaFormVO vo = BeanUtil.toBean(entity, FieldAreaFormVO.class);
        List<FieldAreaDetailEntity> detailList = fieldAreaDetailService.getDetailList(id);
        vo.setDetail(BeanUtil.copyToList(detailList, FieldAreaDetailFormVO.class));
        return vo;
    }

    /**
     * 保存
     *
     * @param form 信息
     */
    @Override
    public void saveUpdate(FieldAreaFormVO form) {
        FieldAreaEntity entity = BeanUtil.toBean(form, FieldAreaEntity.class);
        if (ObjectUtil.isEmpty(form.getId())) {
            entity.setId(String.valueOf(YitIdHelper.nextId()));
        }
        this.saveOrUpdate(entity);
    }

    /**
     * 删除
     *
     * @param ids id数组
     */
    @Override
    public void delete(IdsModel ids) {
        List<FieldAreaEntity> list = this.getListIds(ids.getId());
        List<FieldAreaDetailEntity> detailEntityList = fieldAreaDetailService.getDetailList(ids.getId());
        this.removeBatchByIds(list);
        fieldAreaDetailService.removeBatchByIds(detailEntityList);
    }

    /**
     * 根据id获取列表
     *
     * @param ids 逗号分隔id
     * @return 列表
     */
    private List<FieldAreaEntity> getListIds(String ids) {
        List<String> data = Arrays.asList(ids.split(CommonConst.STRING_COMMA));
        return this.listByIds(data);
    }
}
