package io.github.lancelothuxi.mock.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.github.lancelothuxi.mock.domain.MockData;
import io.github.lancelothuxi.mock.mock.dto.MockDataQuery;

import java.util.List;

/**
 * mock配置关联响应数据Service接口
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-10
 */
public interface IMockDataService extends IService<MockData> {
    /**
     * 查询mock配置关联响应数据
     *
     * @param id mock配置关联响应数据主键
     * @return mock配置关联响应数据
     */
    public MockData selectMockDataById(Long id);

    /**
     * 查询mock配置关联响应数据列表
     *
     * @param mockData mock配置关联响应数据
     * @return mock配置关联响应数据集合
     */
    public List<MockData> queryForPage(MockDataQuery mockDataQuery);

    List<MockData> selectByConfigId(Long configId);

}
