package io.github.lancelothuxi.mock.system.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import io.github.lancelothuxi.mock.dto.BaseEntity;

/**
 * Role
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@TableName(value = "center_role", autoResultMap = true)
public class RoleEntity extends BaseEntity {
    @TableField("name")
    private String name;

    @TableField("remark")
    private String remark;

    @TableField("status")
    private String status;

    @TableField("code")
    private String code;

    @TableField("type")
    private String type;
}
