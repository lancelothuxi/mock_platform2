package io.github.lancelothuxi.mock.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.github.lancelothuxi.mock.system.entity.DataTypeEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author yh_liu
 * @version v1.0
 * @since 2022/8/6
 */
@Mapper
public interface DataTypeMapper extends BaseMapper<DataTypeEntity> {
}