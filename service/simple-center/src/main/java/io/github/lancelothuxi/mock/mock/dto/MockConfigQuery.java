package io.github.lancelothuxi.mock.mock.dto;

import lombok.Data;
import org.simple.dto.PageModel;


@Data
public class MockConfigQuery extends PageModel {

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
     * 开关（1开启 0关闭）
     */
    private String enabled;

    /**
     * 应用名
     */
    private String applicationName;

}
