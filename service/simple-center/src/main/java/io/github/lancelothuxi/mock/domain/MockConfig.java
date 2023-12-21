package io.github.lancelothuxi.mock.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.*;

/**
 * 服务mock方法对象 mock_config
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-11
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class MockConfig extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 服务名
     */
    private String interfaceName;

    /**
     * 方法名
     */
    private String methodName;

    /**
     * 分组名
     */
    private String groupName;

    /**
     * 版本号
     */
    private String version;

    /**
     * 参数数据值
     */
    private String data;

    /**
     * 开关（1开启 0关闭）
     */
    private String enabled;

    /**
     * 创建时间
     */
    private Date createdAt;

    /**
     * 更新时间
     */
    private Date updatedAt;

    /**
     * 匹配参数数据的id
     */
    private Long matchDataId;

    /**
     * 应用名
     */
    private String applicationName;

    /**
     * 是否服务端mock 1是 0 表示客户端mock
     */
    private Long serverSideMock;

    private String type;

    private List<MockData> mockDataList;
}
