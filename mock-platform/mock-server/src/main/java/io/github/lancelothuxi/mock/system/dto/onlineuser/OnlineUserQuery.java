package io.github.lancelothuxi.mock.system.dto.onlineuser;

import lombok.Data;
import lombok.EqualsAndHashCode;
import io.github.lancelothuxi.mock.dto.PageModel;

/**
 * OnlineUserQuery
 *
 * @author lancelot
 * @version v1.0
 * @since 2022-11-27 19:53:32
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class OnlineUserQuery extends PageModel {
    private String name;
}
