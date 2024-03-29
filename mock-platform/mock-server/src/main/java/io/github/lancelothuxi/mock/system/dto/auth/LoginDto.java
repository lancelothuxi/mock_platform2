package io.github.lancelothuxi.mock.system.dto.auth;

import lombok.Builder;
import lombok.Data;

/**
 * LogsDto
 *
 * @author lancelot
 * @version v1.0
 * @since 2022-11-24 21:50:42
 */
@Data
@Builder
public class LoginDto {
    private String token;
}
