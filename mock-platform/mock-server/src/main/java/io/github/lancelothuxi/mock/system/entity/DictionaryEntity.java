package io.github.lancelothuxi.mock.system.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.github.lancelothuxi.mock.dto.BaseEntity;


/**
 * 数据字典实体
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/7/23
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "center_dictionary")
public class DictionaryEntity extends BaseEntity {

    @TableField("code")
    private String code;

    @TableField("value")
    private String value;

    @TableField("label")
    private String label;
}
