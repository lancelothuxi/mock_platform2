package io.github.lancelothuxi.mock.system.dto.menu;

import lombok.Data;
import lombok.EqualsAndHashCode;
import io.github.lancelothuxi.mock.dto.PageModel;

/**
 * MenuQuery
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/12/7
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class MenuQuery extends PageModel {
    private String name;

    private String parentId;

    private String type;
}
