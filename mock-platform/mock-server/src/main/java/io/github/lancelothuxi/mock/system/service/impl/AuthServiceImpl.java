package io.github.lancelothuxi.mock.system.service.impl;

import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.SaLoginConfig;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.BetweenFormatter;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.PageUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.wf.captcha.ArithmeticCaptcha;
import io.github.lancelothuxi.mock.system.dto.auth.LoginParam;
import io.github.lancelothuxi.mock.system.dto.onlineuser.OnlineUserDto;
import io.github.lancelothuxi.mock.system.dto.onlineuser.OnlineUserQuery;
import io.github.lancelothuxi.mock.system.entity.UserEntity;
import io.github.lancelothuxi.mock.system.service.IAuthService;
import io.github.lancelothuxi.mock.system.service.IUserService;
import lombok.AllArgsConstructor;
import io.github.lancelothuxi.mock.config.auth.AuthProperties;
import io.github.lancelothuxi.mock.constant.RedisConst;
import io.github.lancelothuxi.mock.system.ResultCodeEnum;
import io.github.lancelothuxi.mock.exception.CustomException;
import io.github.lancelothuxi.mock.utils.RedisUtil;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * LoginServiceImpl
 *
 * @author lancelot
 * @version v1.0
 * @since 2022-11-24 22:26:08
 */
@Service
@AllArgsConstructor
public class AuthServiceImpl implements IAuthService {
    private final IUserService userService;
    private final RedisUtil redisUtil;
    private final AuthProperties authProperties;

    /**
     * 通过用户名登录
     *
     * @param loginParam 登录参数
     * @return 返回登录实体信息
     * @throws CustomException 异常
     */
    @Override
    public String loginByUserName(LoginParam loginParam) throws CustomException {
        // 验证验证码是否过期或者输入正确
        UserEntity userEntity = BeanUtil.toBean(checkLogin(loginParam), UserEntity.class);
        // 所有验证通过后开始登录
        StpUtil.login(userEntity.getId(), SaLoginConfig.setDevice(loginParam.getDevice()).
                setExtraData(BeanUtil.beanToMap(userEntity)));
        // 登录后获取token信息
        String token = StpUtil.getTokenValue();
        StpUtil.getSession().set("userName", userEntity.getUsername());
        StpUtil.getSession().set("nickName", userEntity.getNickName());
        StpUtil.getSession().set("userId", userEntity.getId());
        StpUtil.getSession().set("tenantId", userEntity.getTenant());
        StpUtil.getSession().set("device", loginParam.getDevice());
        // 将权限信息放入到redis中
        List<String> roleList = userService.getUserRole(userEntity.getId());
        return token;
    }

    /**
     * 获取在线用户
     *
     * @param query 查询参数
     * @return 在线用户列表
     */
    @Override
    public List<OnlineUserDto> getOnlineUser(OnlineUserQuery query) {
        // 创建集合
        List<OnlineUserDto> arrayList = new ArrayList<>();
        int start = PageUtil.getStart(query.getCurrent() - 1, query.getPageSize());
        // 分页查询数据
        List<String> sessionIdList = StpUtil.searchSessionId(query.getName(), start, query.getPageSize(), false);
        for (String sessionId : sessionIdList) {
            SaSession session = StpUtil.getSessionBySessionId(sessionId);
            // 转换登录时间
            Date transformDate = DateUtil.date(session.getCreateTime());
            // 转换剩余时间
            String transformTimeOut = DateUtil.formatBetween(session.getTimeout(), BetweenFormatter.Level.SECOND);
            OnlineUserDto onlineUserDto = OnlineUserDto.builder()
                    .loginDate(transformDate)
                    .timeout(transformTimeOut)
                    .userName(session.getString("userName"))
                    .userId(session.getString("userId"))
                    .nickName(session.getString("nickName"))
                    .device(session.getString("device")).build();
            arrayList.add(onlineUserDto);
        }
        return arrayList;
    }

    /**
     * 获取验证码
     *
     * @param response 返回
     * @param sp       时间
     * @throws IOException 异常
     */
    @Override
    public void getCode(HttpServletResponse response, String sp) throws IOException {
        //生成验证码
        ArithmeticCaptcha captcha = new ArithmeticCaptcha(111, 36);
        captcha.setLen(2);
        String result;
        try {
            result = new Double(Double.parseDouble(captcha.text())).intValue() + "";
        } catch (Exception e) {
            result = captcha.text();
        }
        //存储验证码到redis中
        redisUtil.set(RedisConst.CODE_STR + sp, result
                , RedisConst.CODE_TIMEOUT);
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        // 为了设置验证码课实时刷新
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        ServletOutputStream outputStream = response.getOutputStream();
        captcha.out(outputStream);
    }


    /**
     * 登录验证
     *
     * @param inputVO 登录参数
     * @return 当前用户
     */
    public UserEntity checkLogin(LoginParam inputVO) throws CustomException {
        UserEntity entity = userService.getInfoByUserName(inputVO.getUserName());
        if (entity == null) {
            throw new CustomException(ResultCodeEnum.A5201.getCode());
        }
        int errorCount = ObjectUtil.isNotNull(entity.getErrorCount()) ? entity.getErrorCount() : 0;
        if (errorCount >= authProperties.getErrorNumber()) {
            throw new CustomException(ResultCodeEnum.A5211.getCode());
        }
        DateTime lockTime = DateUtil.date().offset(DateField.MINUTE, authProperties.getLockTime());
        if (ObjectUtil.isNotNull(entity.getLockTime()) && DateUtil.date().isAfter(lockTime)) {
            throw new CustomException(ResultCodeEnum.A5202.getCode());
        }
        String md5Pwd = DigestUtil.md5Hex(inputVO.getUserName().toLowerCase() + inputVO.getPassword());
        if (!entity.getPassword().equals(md5Pwd)) {
            entity.setErrorCount(errorCount + 1);
            entity.setLockTime(DateTime.now());
            userService.updateById(entity);
            throw new CustomException(ResultCodeEnum.A5210.getCode());
        }
        return entity;
    }
}
