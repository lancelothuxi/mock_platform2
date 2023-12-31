package io.github.lancelothuxi.mock.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.lancelothuxi.mock.system.entity.DataTypeDetailEntity;
import io.github.lancelothuxi.mock.system.mapper.DataTypeDetailMapper;
import io.github.lancelothuxi.mock.system.service.IDataTypeDetailService;
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
@RequiredArgsConstructor
public class DataTypeDetailServiceImpl extends ServiceImpl<DataTypeDetailMapper, DataTypeDetailEntity> implements IDataTypeDetailService {
    /**
     * 根据主表id获取明细
     *
     * @param ids 主表id
     * @return 子表信息
     */
    @Override
    public List<DataTypeDetailEntity> getDetailList(String ids) {
        List<String> listIds = Arrays.asList(ids.split(CommonConst.STRING_COMMA));
        QueryWrapper<DataTypeDetailEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().in(DataTypeDetailEntity::getDetailId, listIds);
        return this.list(queryWrapper);
    }

    /**
     * 根据id获取明细
     *
     * @param ids 明细表id
     * @return 子表信息
     */
    @Override
    public List<DataTypeDetailEntity> getList(String ids) {
        List<String> listIds = Arrays.asList(ids.split(CommonConst.STRING_COMMA));
        QueryWrapper<DataTypeDetailEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().in(DataTypeDetailEntity::getId, listIds);
        return this.list(queryWrapper);
    }

}
