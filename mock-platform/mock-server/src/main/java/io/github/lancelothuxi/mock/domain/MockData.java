package io.github.lancelothuxi.mock.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.github.lancelothuxi.mock.mock.MockExpression;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;
import java.util.List;

/**
 * mock配置关联响应数据对象 mock_data
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-10
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class MockData extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * mock规则配置表的id
     */
    private Long mockConfigId;

    /**
     * mock响应数据值
     */
    private String data;

    /**
     * mock请求参数匹配规则
     */
    private String mockReqParams;

    /**
     * 根据jsonpath eval后的实际值
     */
    private String expectedValue;

    /**
     * 超时时间
     */
    private Integer timeout;

    /**
     * 服务名
     */
    private String interfaceName;

    /**
     * 方法名
     */
    private String methodName;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createdTime;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date updatedTime;

    /**
     * 是否启用
     */
    private Long enabled;

    private String applicationName;

    private List<MockExpression> mockExpressions;
}
