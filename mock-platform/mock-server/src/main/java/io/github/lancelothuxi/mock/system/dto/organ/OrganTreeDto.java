package io.github.lancelothuxi.mock.system.dto.organ;

import lombok.Data;
import lombok.EqualsAndHashCode;
import io.github.lancelothuxi.mock.dto.BaseTree;

import java.util.Date;

/**
 * OrganTreeDto
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class OrganTreeDto extends BaseTree<OrganTreeDto> {
    private String tenantName;
    private String tenantId;
    private Integer sort;
    private Date createTime;
}
