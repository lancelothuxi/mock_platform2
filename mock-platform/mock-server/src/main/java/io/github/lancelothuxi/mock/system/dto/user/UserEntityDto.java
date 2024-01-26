package io.github.lancelothuxi.mock.system.dto.user;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.github.lancelothuxi.mock.system.entity.UserEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * UserDto
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class UserEntityDto extends UserEntity {

    private String tenantName;
    private String roles;
    private String roleIds;

    @JsonProperty("nPassword")
    private String nPassword;
}
