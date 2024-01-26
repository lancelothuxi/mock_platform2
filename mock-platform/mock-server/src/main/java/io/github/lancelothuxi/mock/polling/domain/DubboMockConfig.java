package io.github.lancelothuxi.mock.polling.domain;

import lombok.Data;

import java.util.Date;

/**
 * dubbo mock配置表 dubbo_mock_config
 *
 * @author luckyframe
 * @since 2022-02-11
 */
@Data
public class DubboMockConfig {
    /**
     *
     */
    private Long id;
    /**
     * 接口
     */
    private String interfaceName;
    /**
     * 方法
     */
    private String methodName;
    /**
     * 分组
     */
    private String groupName;
    /**
     * 版本
     */
    private String version;
    /**
     * mock数据
     */
    private String data;
    /**
     * 是否启用
     */
    private Integer enabled;
    /**
     *
     */
    private Date createTime;
    /**
     *
     */
    private Date updateTime;

}
