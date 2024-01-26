package io.github.lancelothuxi.mock.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.github.lancelothuxi.mock.system.entity.DictionaryEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * DictionaryMapper
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
@Mapper
public interface DictionaryMapper extends BaseMapper<DictionaryEntity> {
}
