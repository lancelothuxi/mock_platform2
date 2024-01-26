package io.github.lancelothuxi.mock.system.entity;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Menu
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName(value = "center_menu", autoResultMap = true)
public class MenuEntity {

    /**
     * 主键id
     */
    @TableId(value = "id")
    private String id;

    @TableField("name")
    private String name;

    @TableField("type")
    private String type;

    @TableField("authcode")
    private String authCode;

    @TableField("path")
    private String path;

    @TableField("parentid")
    private String parentId;

    @TableField("component")
    private String component;

    @TableField("status")
    private String status;

    @TableField("sort")
    private String sort;

    @TableField(typeHandler = JacksonTypeHandler.class)
    private JSONObject meta;
}
