package io.github.lancelothuxi.mock.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.lancelothuxi.mock.domain.MockData;
import io.github.lancelothuxi.mock.mapper.MockDataMapper;
import io.github.lancelothuxi.mock.mock.dto.MockDataQuery;
import io.github.lancelothuxi.mock.service.IMockConfigService;
import io.github.lancelothuxi.mock.service.IMockDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * mock配置关联响应数据Service业务层处理
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-10
 */
@Service
public class MockDataServiceImpl extends ServiceImpl<MockDataMapper,MockData> implements IMockDataService {

    @Autowired
    RedisTemplate redisTemplate;
    @Autowired
    IMockConfigService mockConfigService;
    @Autowired
    private MockDataMapper mockDataMapper;

    /**
     * 查询mock配置关联响应数据
     *
     * @param id mock配置关联响应数据主键
     * @return mock配置关联响应数据
     */
    @Override
    public MockData selectMockDataById(Long id) {
        return mockDataMapper.selectMockDataById(id);
    }

    @Override
    public List<MockData> queryForPage(MockDataQuery mockDataQuery) {
        return null;
    }

    @Override
    public List<MockData> selectByConfigId(Long configId) {
        return null;
    }

    /**
     * 查询mock配置关联响应数据列表
     *
     * @param mockData mock配置关联响应数据
     * @return mock配置关联响应数据
     */
    public List<MockData> selectMockDataList(MockData mockData) {
        return mockDataMapper.selectMockDataList(mockData);
    }

}
