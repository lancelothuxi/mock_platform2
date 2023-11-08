package io.github.lancelothuxi.mock.cache;

import com.alibaba.fastjson.JSON;
import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import io.github.lancelothuxi.mock.domain.MockConfig;
import io.github.lancelothuxi.mock.domain.MockData;
import io.github.lancelothuxi.mock.mock.MockExpression;
import io.github.lancelothuxi.mock.service.IMockConfigService;
import io.github.lancelothuxi.mock.service.IMockDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * @author lancelot
 * @version 1.0
 * @since 2023/7/18 下午2:49
 */
@Component
public class LocalCache implements MessageListener {

    @Autowired
    RedisTemplate redisTemplate;
    @Autowired
    IMockConfigService mockConfigService;
    @Autowired
    IMockDataService mockDataService;
    private Cache<String, MockConfig> mockConfigCache;

    @PostConstruct
    private void init() {
        mockConfigCache = Caffeine.newBuilder().maximumSize(Long.MAX_VALUE).build();
        // 启动吧数据库所有enabled mock数据加载到本地缓存
        MockConfig query = new MockConfig();
        query.setEnabled("1");
        List<MockConfig> mockConfigs = mockConfigService.selectMockConfigList(query);
        for (MockConfig mockConfig : mockConfigs) {
            addToCache(mockConfig);
        }


    }

    private void addToCache(MockConfig mockConfig) {
        String cacheKey =
                CacheUtil.buildKey4Config(
                        mockConfig.getAppliactionName(),
                        mockConfig.getType(),
                        mockConfig.getAppliactionName(),
                        mockConfig.getMethodName(),
                        mockConfig.getGroupName(),
                        mockConfig.getVersion());
        List<MockData> mockDataList = mockDataService.selectByConfigId(mockConfig.getId() + "");
        mockConfig.setMockDataList(mockDataList);

        if (mockConfig.getDirectMatch() != null && mockConfig.getDirectMatch() == 1) {
            for (MockData mockData : mockDataList) {
                List<MockExpression> mockExpressions = mockData.getMockExpressions();
                for (MockExpression mockExpression : mockExpressions) {
                    mockConfig.getDirMockDataMap().put(mockExpression.getExpectedValue(), mockData);
                }
            }
        }
        mockConfigCache.put(cacheKey, mockConfig);
    }

    public MockConfig getMockConfigWithCache(MockConfig request) {

        String cacheKey =
                CacheUtil.buildKey4Config(
                        request.getAppliactionName(),
                        request.getType(),
                        request.getAppliactionName(),
                        request.getMethodName(),
                        request.getGroupName(),
                        request.getVersion());

        MockConfig mockConfig = mockConfigCache.getIfPresent(cacheKey);
        if (mockConfig == null) {
            request.setEnabled("1");
            MockConfig real = mockConfigService.selectMockConfig(request);
            if (real != null) {
                List<MockData> mockDataList = mockDataService.selectByConfigId(real.getId() + "");
                real.setMockDataList(mockDataList);
                mockConfigCache.put(cacheKey, real);
            }
            return real;
        } else {
            return mockConfig;
        }
    }

    /**
     * 删除
     *
     * @param request
     */
    public void mockConfigDelete(MockConfig request) {
        MockConfigCacheUpdateMessage mockConfigCacheUpdateMessage =
                convertToMessag(request, OperationConstant.ADD);
        mockConfigCacheUpdateMessage.setOp(OperationConstant.DELETE);
        redisTemplate.convertAndSend("mockConfigChanged", JSON.toJSONString(mockConfigCacheUpdateMessage);
    }

    /**
     * 新增
     *
     * @param request
     */
    public void mockConfigAdd(MockConfig request) {
        MockConfigCacheUpdateMessage mockConfigCacheUpdateMessage =
                convertToMessag(request, OperationConstant.ADD);
        redisTemplate.convertAndSend("mockConfigChanged", JSON.toJSONString(mockConfigCacheUpdateMessage);
    }

    /**
     * 跟你新年
     *
     * @param request
     */
    public void mockConfigUpdate(MockConfig request) {
        MockConfigCacheUpdateMessage mockConfigCacheUpdateMessage =
                convertToMessag(request, OperationConstant.UPDATE);
        redisTemplate.convertAndSend("mockConfigChanged", JSON.toJSONString(mockConfigCacheUpdateMessage));
    }

    private MockConfigCacheUpdateMessage convertToMessag(MockConfig request, String add) {
        MockConfigCacheUpdateMessage mockConfigCacheUpdateMessage = new MockConfigCacheUpdateMessage();
        mockConfigCacheUpdateMessage.setOp(add);
        mockConfigCacheUpdateMessage.setId(request.getId());
        mockConfigCacheUpdateMessage.setInterfaceName(request.getInterfaceName());
        mockConfigCacheUpdateMessage.setMethodName(request.getMethodName());
        mockConfigCacheUpdateMessage.setGroupName(request.getGroupName());
        mockConfigCacheUpdateMessage.setVersion(request.getVersion());
        mockConfigCacheUpdateMessage.setApplicationName(request.getAppliactionName());
        mockConfigCacheUpdateMessage.setType(request.getType());
        return mockConfigCacheUpdateMessage;
    }

    @Override
    public void onMessage(Message message, byte[] pattern) {

        byte[] messageBody = message.getBody();
        MockConfigCacheUpdateMessage request =
                JSON.parseObject(messageBody, MockConfigCacheUpdateMessage.class);

        String op = request.getOp();

        String cacheKey =
                CacheUtil.buildKey4Config(
                        request.getApplicationName(),
                        request.getType(),
                        request.getApplicationName(),
                        request.getMethodName(),
                        request.getGroupName(),
                        request.getVersion());

        if (OperationConstant.ADD.equals(op)) {
            MockConfig mockConfigRequest = new MockConfig();
            mockConfigRequest.setType(request.getType());
            mockConfigRequest.setInterfaceName(request.getInterfaceName());
            mockConfigRequest.setMethodName(request.getMethodName());
            mockConfigRequest.setGroupName(request.getGroupName());
            mockConfigRequest.setVersion(request.getVersion());
            mockConfigRequest.setEnabled("1");
            mockConfigRequest.setAppliactionName(request.getApplicationName());

            MockConfig real = mockConfigService.selectMockConfig(mockConfigRequest);
            if (real != null) {
                addToCache(real);
            }

            return;
        }

        if (OperationConstant.DELETE.equals(op)) {
            mockConfigCache.invalidate(cacheKey);
            return;
        }

        if (OperationConstant.UPDATE.equals(op)) {

            mockConfigCache.invalidate(cacheKey);
            MockConfig mockConfigRequest = new MockConfig();
            mockConfigRequest.setType(request.getType());
            mockConfigRequest.setInterfaceName(request.getInterfaceName());
            mockConfigRequest.setMethodName(request.getMethodName());
            mockConfigRequest.setGroupName(request.getGroupName());
            mockConfigRequest.setVersion(request.getVersion());
            mockConfigRequest.setEnabled("1");
            mockConfigRequest.setAppliactionName(request.getApplicationName());

            MockConfig real = mockConfigService.selectMockConfig(mockConfigRequest);
            if (real != null) {
                addToCache(real);
            }
        }
    }
}
