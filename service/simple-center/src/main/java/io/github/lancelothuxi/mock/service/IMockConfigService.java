package io.github.lancelothuxi.mock.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.github.lancelothuxi.mock.domain.MockConfig;
import io.github.lancelothuxi.mock.mock.dto.MockConfigQuery;

import java.util.List;

/**
 * 服务mock方法Service接口
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-11
 */
public interface IMockConfigService extends IService<MockConfig> {
    List<MockConfig> queryForPage(MockConfigQuery mockConfigQuery);
}
