package io.github.lancelothuxi.mock.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.github.lancelothuxi.mock.system.entity.TableEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author ThePai
 * @version v1.0
 * @since 2022/8/16
 */
@Mapper
public interface TableMapper extends BaseMapper<TableEntity> {
}
