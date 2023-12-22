package io.github.lancelothuxi.mock.system.service;

import io.github.lancelothuxi.mock.system.dto.auth.LoginParam;
import io.github.lancelothuxi.mock.system.dto.onlineuser.OnlineUserDto;
import io.github.lancelothuxi.mock.system.dto.onlineuser.OnlineUserQuery;
import io.github.lancelothuxi.mock.exception.CustomException;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * LoginService
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022-11-24 22:24:29
 */
public interface IAuthService {

    /**
     * 通过用户名登录
     *
     * @param loginParam 登录参数
     * @return 返回登录实体信息
     * @throws CustomException 异常信息
     */
    String loginByUserName(LoginParam loginParam) throws CustomException;

    /**
     * 获取当前在线用户
     *
     * @param query 查询参数
     * @return 在线用户
     */
    List<OnlineUserDto> getOnlineUser(OnlineUserQuery query);

    /**
     * 获取验证码
     *
     * @param response 返回
     * @param sp       时间
     * @throws IOException 异常
     */
    void getCode(HttpServletResponse response, String sp) throws IOException;
}
