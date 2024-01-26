package io.github.lancelothuxi.mock.system.dto.auth;

import lombok.Data;


/**
 * LoginParam
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022-11-24 22:16:46
 */
@Data
public class LoginParam {

    private String code;

    private String sp;

    private String userName;

    private String password;

    private String device;
}
