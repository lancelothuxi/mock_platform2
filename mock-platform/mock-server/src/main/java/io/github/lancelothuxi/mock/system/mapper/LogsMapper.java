package io.github.lancelothuxi.mock.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.github.lancelothuxi.mock.system.dto.log.LogsQuery;
import io.github.lancelothuxi.mock.system.entity.LogsEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * LogsMapper
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
@Mapper
public interface LogsMapper extends BaseMapper<LogsEntity> {
    List<LogsEntity> logsList(@Param("obj") LogsQuery logs);
}
