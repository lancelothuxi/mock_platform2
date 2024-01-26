package io.github.lancelothuxi.mock.system.dto.user;

import lombok.Data;
import lombok.EqualsAndHashCode;
import io.github.lancelothuxi.mock.dto.PageModel;

/**
 * UserQuery
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class UserQuery extends PageModel {

    private String tenant;
    private String nickName;
    private String status;
}
