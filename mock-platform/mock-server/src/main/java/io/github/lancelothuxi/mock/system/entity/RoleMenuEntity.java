package io.github.lancelothuxi.mock.system.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * RoleMenu
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
@Data
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
@TableName(value = "center_rolemenu", autoResultMap = true)
public class RoleMenuEntity {

    @TableField("role")
    private String role;

    @TableField("menu")
    private String menu;
}
