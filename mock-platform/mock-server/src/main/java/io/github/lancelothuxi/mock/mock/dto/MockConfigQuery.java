package io.github.lancelothuxi.mock.mock.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.github.lancelothuxi.mock.dto.PageModel;


@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
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


    private String type;

}
