package io.github.lancelothuxi.mock.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.github.lancelothuxi.mock.domain.MockData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * mock配置关联响应数据Mapper接口
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-10
 */
@Mapper
public interface MockDataMapper extends BaseMapper<MockData> {
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
    public List<MockData> selectMockDataList(MockData mockData);
}
