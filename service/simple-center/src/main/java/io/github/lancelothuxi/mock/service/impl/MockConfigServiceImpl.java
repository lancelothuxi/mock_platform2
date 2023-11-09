package io.github.lancelothuxi.mock.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.lancelothuxi.mock.cache.LocalCache;
import io.github.lancelothuxi.mock.domain.MockConfig;
import io.github.lancelothuxi.mock.mapper.MockConfigMapper;
import io.github.lancelothuxi.mock.service.IMockConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 服务mock方法Service业务层处理
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-11
 */
@Service
public class MockConfigServiceImpl extends ServiceImpl<MockConfigMapper,MockConfig> implements IMockConfigService {
    @Autowired
    LocalCache localCache;

    @Override
    public boolean updateById(MockConfig entity) {
        super.updateById(entity);
        MockConfig real = this.getById(entity);
        localCache.mockConfigUpdate(real);
        return super.updateById(entity);
    }
}
