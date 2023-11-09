package io.github.lancelothuxi.mock.k8s.dto;


import lombok.Data;
import org.simple.dto.PageModel;

@Data
public class KubeConfigQuery extends PageModel {

    /**
     * 名称
     */
    private String name;

    /**
     * 是否生效
     */
    private Long isValid;
}
