package io.github.lancelothuxi.mock.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.github.lancelothuxi.mock.domain.MockConfig;
import io.github.lancelothuxi.mock.system.entity.MenuEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 服务mock方法Mapper接口
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-11
 */
@Mapper
public interface MockConfigMapper extends BaseMapper<MockConfig> {
}
