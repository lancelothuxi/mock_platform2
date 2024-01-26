package io.github.lancelothuxi.mock.system.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.stp.StpUtil;
import io.github.lancelothuxi.mock.system.dto.auth.LoginParam;
import io.github.lancelothuxi.mock.system.dto.onlineuser.OnlineUserDto;
import io.github.lancelothuxi.mock.system.dto.onlineuser.OnlineUserQuery;
import io.github.lancelothuxi.mock.system.service.IAuthService;
import lombok.AllArgsConstructor;
import io.github.lancelothuxi.mock.dto.PageResult;
import io.github.lancelothuxi.mock.exception.CustomException;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * 验证码控制器
 *
 * @author lancelot
 * @version v1.0
 * @since 2022-11-24 22:15:00
 */
@RestController
@AllArgsConstructor
@RequestMapping("/center/system/auth")
public class AuthController {
    private final IAuthService authService;

    @SaIgnore
    @PostMapping("/doLogin")
    public String doLogin(@RequestBody  LoginParam loginParam) throws CustomException {
        return authService.loginByUserName(loginParam);
    }

    @GetMapping("logout")
    public void logout() {
        StpUtil.logout(StpUtil.getLoginId(), StpUtil.getLoginDevice());
    }

    @GetMapping("userLogout")
    public void userLogout(String userId) {
        StpUtil.kickout(userId);
    }

    @GetMapping("list")
    public PageResult<OnlineUserDto> getList(OnlineUserQuery query) {
        List<OnlineUserDto> list = authService.getOnlineUser(query);
        PageResult<OnlineUserDto> pageResult = new PageResult<>(list);
        pageResult.setTotal(query.getTotal());
        return pageResult;
    }

    @SaIgnore
    @GetMapping("/getCode")
    public void getCode(HttpServletResponse response, @RequestParam("sp") String sp) throws IOException {
        authService.getCode(response, sp);
    }
}
