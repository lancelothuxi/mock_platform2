package io.github.lancelothuxi.mock.system.dto.code;

import lombok.Data;
import lombok.EqualsAndHashCode;
import io.github.lancelothuxi.mock.dto.PageModel;

/**
 * CodeQuery
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/12/7
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class TableQuery extends PageModel {
    private String dataId;
    private String tableName;
}
