package io.github.lancelothuxi.mock.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.lancelothuxi.mock.system.entity.FieldAreaDetailEntity;
import io.github.lancelothuxi.mock.system.mapper.FieldAreaDetailMapper;
import io.github.lancelothuxi.mock.system.service.IFieldAreaDetailService;
import lombok.RequiredArgsConstructor;
import io.github.lancelothuxi.mock.constant.CommonConst;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * 数据域主表;(s_d_field_area_detail)表服务实现类
 *
 * @author ThePai
 * @version v1.0
 * @since 2022/8/7
 */
@Service
@RequiredArgsConstructor
public class FieldAreaDetailServiceImpl extends ServiceImpl<FieldAreaDetailMapper, FieldAreaDetailEntity> implements IFieldAreaDetailService {
    /**
     * 根据主表id获取明细
     *
     * @param ids 主表id
     * @return 子表信息
     */
    @Override
    public List<FieldAreaDetailEntity> getDetailList(String ids) {
        List<String> listIds = Arrays.asList(ids.split(CommonConst.STRING_COMMA));
        QueryWrapper<FieldAreaDetailEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().in(FieldAreaDetailEntity::getFieldId, listIds);
        return this.list(queryWrapper);
    }

    /**
     * 根据id获取明细
     *
     * @param ids 明细表id
     * @return 子表信息
     */
    @Override
    public List<FieldAreaDetailEntity> getList(String ids) {
        List<String> listIds = Arrays.asList(ids.split(CommonConst.STRING_COMMA));
        QueryWrapper<FieldAreaDetailEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().in(FieldAreaDetailEntity::getId, listIds);
        return this.list(queryWrapper);
    }
}
