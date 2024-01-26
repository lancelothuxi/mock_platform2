package io.github.lancelothuxi.mock.domain;

import lombok.Data;


/**
 * k8s管理对象 kube_config
 *
 * @author ruoyi
 * @date 2023-09-08
 */
@Data
public class KubeConfig {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 是否生效
     */
    private Long isValid;

    /**
     * kuebeconfig文件内容
     */
    private String content;

}
