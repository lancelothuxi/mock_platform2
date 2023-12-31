package io.github.lancelothuxi.mock.system.controller;

import io.github.lancelothuxi.mock.system.dto.datatype.DataTypeVO;
import io.github.lancelothuxi.mock.system.entity.DataTypeEntity;
import io.github.lancelothuxi.mock.system.service.IDataTypeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import io.github.lancelothuxi.mock.dto.EnumVO;
import io.github.lancelothuxi.mock.dto.IdsModel;
import io.github.lancelothuxi.mock.dto.PageModel;
import io.github.lancelothuxi.mock.dto.PageResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 数据类型定义 前端控制器
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022-12-13
 */
@Tag(name = "dataType", description = "数据类型定义")
@RestController
@RequestMapping("/center/online/dataType")
@RequiredArgsConstructor
public class DataTypeController {

    private final IDataTypeService dataTypeService;

    /**
     * 查询列表分页
     *
     * @param pageModel 分页参数
     * @return 分页列表
     */
    @Operation(summary = "查询列表")
    @GetMapping("/list")
    public PageResult<DataTypeEntity> list(PageModel pageModel) {
        List<DataTypeEntity> list = dataTypeService.list(pageModel);
        PageResult<DataTypeEntity> pageResult = new PageResult<>(list);
        pageResult.setTotal(pageModel.getTotal());
        return pageResult;
    }

    /**
     * 查询单条信息
     *
     * @param id 主键id
     * @return 单条信息
     */
    @Operation(summary = "查询信息")
    @GetMapping("/info/{id}")
    public DataTypeVO info(@PathVariable String id) {
        return dataTypeService.info(id);
    }

    /**
     * 保存单条信息
     *
     * @param entity 实体
     */
    @Operation(summary = "保存")
    @PostMapping("/save")
    public void save(@RequestBody DataTypeVO entity) {
        dataTypeService.saveUpdate(entity);
    }

    /**
     * 批量删除信息
     *
     * @param ids 逗号分隔id
     */
    @Operation(summary = "删除")
    @PostMapping("/delete")
    public void delete(@RequestBody IdsModel ids) {
        dataTypeService.delete(ids);
    }

    /**
     * 获取数据类型枚举
     *
     * @return 列表
     */
    @Operation(summary = "获取数据类型枚举")
    @GetMapping("/getDataType")
    public List<EnumVO> getDataType() {
        return dataTypeService.getDataTypeEnum();
    }
}
