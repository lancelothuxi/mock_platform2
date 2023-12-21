package io.github.lancelothuxi.mock.mock;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONPath;
import com.alibaba.fastjson.JSONPathException;
import io.github.lancelothuxi.mock.domain.MockConfig;
import io.github.lancelothuxi.mock.domain.MockData;
import io.netty.util.HashedWheelTimer;
import io.netty.util.Timeout;
import io.netty.util.TimerTask;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;

/**
 * @author lancelot
 * @version 1.0
 * @since 2023/6/17 下午12:32
 */
public class MockUtil {

    private static final Logger logger = LoggerFactory.getLogger(MockUtil.class);
    private static HashedWheelTimer hashedWheelTimer =
            new HashedWheelTimer(Executors.defaultThreadFactory(), 100, TimeUnit.NANOSECONDS);

    public static void sleep(long milliSeconds, long elapsed) throws InterruptedException {
        // 如果mock逻辑额外耗时已经超过 milliSeconds 则不需要mock
        if (elapsed >= milliSeconds) {
            return;
        }

        final long expectedCost = milliSeconds - elapsed;

        CountDownLatch countDownLatch = new CountDownLatch(1);

        hashedWheelTimer.newTimeout(
                new TimerTask() {
                    @Override
                    public void run(Timeout timeout) {
                        countDownLatch.countDown();
                    }
                },
                expectedCost,
                TimeUnit.MILLISECONDS);

        countDownLatch.await();
    }

    public static MockData getMockData(
            String args, MockConfig mockConfig, List<MockData> mockDataList) {

        Object jsonObject = JSON.parse(args);

        if (mockDataList == null || mockDataList.isEmpty()) {
            if (logger.isInfoEnabled()) {
                logger.info("mock mockDataList is empty ");
            }
            return null;
        }

        Map<String, String> jsonPathValueMap = new HashMap<>();

        for (MockData mockData : mockDataList) {
            // 获取agent所切方法调用的 实际传参
            try {
                boolean checkMatch = andMatch(jsonObject, mockData.getMockExpressions(), jsonPathValueMap);
                if (checkMatch) {
                    return mockData;
                }

            } catch (Exception ex) {
            }
        }

        return null;
    }

    public static boolean andMatch(
            Object jsonObject,
            List<MockExpression> mockExpressions,
            Map<String, String> jsonPathValueMap) {

        // 对实际参数 做jsonPath evaluation 看是否符合 条件
        if (mockExpressions == null || mockExpressions.size() == 0) {
            return true;
        }

        for (MockExpression mockExpression : mockExpressions) {

            String jsonPath = mockExpression.getJsonPath();
            if (!jsonPathValueMap.containsKey(jsonPath)) {
                final Object jsonPathValue = JSONPath.compile(jsonPath).eval(jsonObject);
                jsonPathValueMap.put(jsonPath, jsonPathValue == null ? null : jsonPathValue.toString());
            }

            Object jsonPathValue = jsonPathValueMap.get(jsonPath);

            if (jsonPathValue == null) {
                return false;
            }

            // 对实际参数 做jsonPath evaluation 看是否符合 条件
            if (!jsonPathValue.equals(mockExpression.getExpectedValue())) {
                return false;
            }
        }
        return true;
    }

}
