package io.github.lancelothuxi.mock.dto;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;

/**
 * 默认字段对象
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/7/7
 */
@Data
public class BaseEntity {

    /**
     * 主键id
     */
    @TableId(value = "id")
    private String id;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 创建人id
     */
    @TableField(value = "create_user_id", fill = FieldFill.INSERT)
    private String createUserId;

    /**
     * 创建人
     */
    @TableField(value = "create_user_name", fill = FieldFill.INSERT)
    private String createUserName;

    /**
     * 创建人组织id
     */
    @TableField(value = "create_org_id", fill = FieldFill.INSERT)
    private String createOrgId;

    /**
     * 修改时间
     */
    @TableField(value = "modify_time", fill = FieldFill.UPDATE)
    private Date modifyTime;

    /**
     * 修改人id
     */
    @TableField(value = "modify_user_id", fill = FieldFill.UPDATE)
    private String modifyUserId;

    /**
     * 修改人
     */
    @TableField(value = "modify_user_name", fill = FieldFill.UPDATE)
    private String modifyUserName;

    /**
     * 说明
     */
    @TableField(value = "description")
    private String description;

    /**
     * 排序号
     */
    @TableField(value = "sort_index")
    private Double sortIndex;

    /**
     * 租户id
     */
    @TableField(value = "tenant_id")
    private String tenantId;

    /**
     * 是否删除
     */
    @TableField(value = "is_deleted", fill = FieldFill.INSERT)
    private String isDeleted;
}
