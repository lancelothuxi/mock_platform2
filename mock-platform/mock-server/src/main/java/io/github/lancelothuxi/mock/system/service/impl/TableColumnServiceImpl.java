package io.github.lancelothuxi.mock.system.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.lancelothuxi.mock.system.entity.TableColumnEntity;
import io.github.lancelothuxi.mock.system.mapper.TableColumnMapper;
import io.github.lancelothuxi.mock.system.service.ITableColumnService;
import lombok.RequiredArgsConstructor;
import io.github.lancelothuxi.mock.constant.CommonConst;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * @author yh_liu
 * @version v1.0
 * @since 2022-08-06
 */
@Service
@DS(CommonConst.DB_BASE)
@RequiredArgsConstructor
public class TableColumnServiceImpl extends ServiceImpl<TableColumnMapper, TableColumnEntity> implements ITableColumnService {
    /**
     * 根据主表id获取明细
     *
     * @param ids 主表id
     * @return 子表信息
     */
    @Override
    public List<TableColumnEntity> getDetailList(String ids) {
        List<String> listIds = Arrays.asList(ids.split(CommonConst.STRING_COMMA));
        QueryWrapper<TableColumnEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().in(TableColumnEntity::getTableId, listIds);
        return this.list(queryWrapper);
    }

    /**
     * 根据id获取明细
     *
     * @param ids 明细表id
     * @return 子表信息
     */
    @Override
    public List<TableColumnEntity> getList(String ids) {
        List<String> listIds = Arrays.asList(ids.split(CommonConst.STRING_COMMA));
        QueryWrapper<TableColumnEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().in(TableColumnEntity::getId, listIds);
        return this.list(queryWrapper);
    }

}
