package io.github.lancelothuxi.mock.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import io.github.lancelothuxi.mock.system.entity.DictionaryEntity;

/**
 * DictionaryMapper
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
@Mapper
public interface DictionaryMapper extends BaseMapper<DictionaryEntity> {
}
