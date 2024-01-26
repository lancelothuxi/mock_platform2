package io.github.lancelothuxi.mock.system.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.github.lancelothuxi.mock.dto.BaseEntity;

import java.util.Date;

/**
 * User
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("center_user")
public class UserEntity extends BaseEntity {

    @TableField("username")
    private String username;

    @TableField("password")
    private String password;

    @TableField("nick_name")
    private String nickName;

    @TableField("phone")
    private String phone;

    @TableField("email")
    private String email;

    @TableField("status")
    private String status;

    @TableField("avatar")
    private String avatar;

    @TableField("login_date")
    private Date loginDate;

    @TableField("error_count")
    private Integer errorCount;

    @TableField("lock_time")
    private Date lockTime;

    @TableField("tenant")
    private String tenant;

    @TableField("organ")
    private String organ;
}