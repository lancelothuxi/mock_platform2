package io.github.lancelothuxi.mock.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaMode;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.DesensitizedUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.github.yitter.idgen.YitIdHelper;
import io.github.lancelothuxi.mock.system.dto.menu.MenuTreeDto;
import io.github.lancelothuxi.mock.system.dto.user.UserEntityDto;
import io.github.lancelothuxi.mock.system.dto.user.UserQuery;
import io.github.lancelothuxi.mock.system.entity.UserEntity;
import io.github.lancelothuxi.mock.system.service.IUserService;
import lombok.AllArgsConstructor;
import io.github.lancelothuxi.mock.constant.CommonConst;
import io.github.lancelothuxi.mock.constant.RedisConst;
import io.github.lancelothuxi.mock.dto.PageResult;
import io.github.lancelothuxi.mock.system.ResultCodeEnum;
import io.github.lancelothuxi.mock.utils.AuthUtils;
import io.github.lancelothuxi.mock.utils.CommonResult;
import io.github.lancelothuxi.mock.utils.RedisUtil;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户管理
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
@RestController
@AllArgsConstructor
@RequestMapping("/center/system/user")
public class UserController {
    private final IUserService userService;
    private final RedisUtil redisUtil;

    @GetMapping("info")
    public Map<String, Object> getUserInfo() {
        String userId = AuthUtils.getUserId();
        UserEntity userEntity = userService.getById(userId);
        Map<String, Object> userInfo =
                BeanUtil.beanToMap(userId);
        userInfo.put("avatar", userEntity.getAvatar());
        userInfo.put("nickName", userEntity.getNickName());
        Map<String, Object> result = new HashMap<>(10);
        result.put("roles", StpUtil.getPermissionList(userId));
        result.put("user", userInfo);
        return result;
    }

    @GetMapping("menu")
    public List<MenuTreeDto> getUserMenu() {
        return userService.getUserMenu(AuthUtils.getUserId());
    }

    @GetMapping("list")
    @SaCheckPermission(value = {"system:user:query"}, mode = SaMode.OR)
    public PageResult<UserEntityDto> list(UserQuery query) {
        List<UserEntityDto> list = userService.listAll(query);
        PageResult<UserEntityDto> pageResult = new PageResult<>(list);
        pageResult.setTotal(query.getTotal());
        return pageResult;
    }

    @GetMapping("list1")
    public List<UserEntity> list1(UserEntity userEntity) {
        String id = userEntity.getId();
        userEntity.setId(null);
        return userService.list(Wrappers.query(userEntity).notIn("id", id));
    }

    @PostMapping("addUser")
    @SaCheckPermission(value = {"system:user:add"}, mode = SaMode.OR)
    public CommonResult addUser(@RequestBody UserEntityDto userDto) {
        String userid = String.valueOf(YitIdHelper.nextId());
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userid);
        userEntity.setStatus("0");
        userEntity.setErrorCount(0);
        String md5Pwd = DigestUtil.md5Hex(userDto.getUsername().toLowerCase() + userDto.getPassword());
        userEntity.setPassword(md5Pwd);
        userEntity.setPhone(userDto.getPhone());
        userEntity.setEmail(userDto.getEmail());
        userEntity.setNickName(userDto.getNickName());
        userEntity.setUsername(userDto.getUsername());
        userEntity.setOrgan(userDto.getOrgan());
        userService.save(userEntity);
        userService.insertUserTenant(String.valueOf(YitIdHelper.nextId()), userEntity.getTenant(), userid);
        //for循环插入用户角色关联关系数据
        String[] roles = userDto.getRoles().split(CommonConst.STRING_COMMA);
        for (String role : roles) {
            userService.insertRoleUser(String.valueOf(YitIdHelper.nextId()), role, userid);
        }
        return CommonResult.success();
    }

    @PostMapping("editUser")
    @SaCheckPermission(value = {"system:user:edit"}, mode = SaMode.OR)
    public void editUser(@RequestBody UserEntityDto userDto) {
        userService.updateUser(userDto);
    }

    @PostMapping("delUser/{id}")
    @SaCheckPermission(value = {"system:user:del"}, mode = SaMode.OR)
    public CommonResult delUser(@PathVariable("id") String id) {
        if (CommonConst.SUPER_ADMIN.equals(id)) {
            return CommonResult.failed("不允许删除超级管理员");
        }
        return CommonResult.success(userService.delUser(id));
    }

    @GetMapping("lock/{id}")
    public CommonResult lock(@PathVariable("id") String id) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(id);
        userEntity.setStatus("1");
        userService.updateById(userEntity);
        return CommonResult.success(ResultCodeEnum.A5203.getCode());
    }

    @GetMapping("unlock/{id}")
    public CommonResult unlock(@PathVariable("id") String id) {
        UserEntity userEntity = new UserEntity();
        userEntity.setId(id);
        userEntity.setStatus("0");
        userService.updateById(userEntity);
        return CommonResult.success();
    }

    @GetMapping("resetPwd/{id}")
    public CommonResult resetPwd(@PathVariable("id") String id) {
        UserEntity userEntity = userService.getById(id);
        String md5Pwd = DigestUtil.md5Hex(userEntity.getUsername().toLowerCase() + "888888");
        userEntity.setPassword(md5Pwd);
        userService.updateById(userEntity);
        return CommonResult.success();
    }

    @PostMapping("updatePwd")
    public CommonResult updatePwd(@RequestBody UserEntityDto userDto) {
        UserEntity userEntity = new UserEntity();
        if (StrUtil.isEmpty(userDto.getId())) {
            userDto.setId(AuthUtils.getUserId());
        }
        userEntity.setId(userDto.getId());
        String md5Pwd = DigestUtil.md5Hex(userEntity.getUsername().toLowerCase() + userDto.getNPassword());
        userEntity.setPassword(md5Pwd);
        userService.updateById(userEntity);
        return CommonResult.success();
    }

    @PostMapping("checkPwd")
    public CommonResult checkPwd(@RequestBody UserEntityDto userDto) {
        if (StrUtil.isEmpty(userDto.getId())) {
            userDto.setId(AuthUtils.getUserId());
        }
        UserEntity userEntity = userService.getById(userDto.getId());
        String md5Pwd = DigestUtil.md5Hex(userDto.getUsername().toLowerCase() + userDto.getNPassword());
        if (!userEntity.getPassword().equals(md5Pwd)) {
            return CommonResult.failed(ResultCodeEnum.A5210.getMsg());
        }
        return CommonResult.success();
    }

    @GetMapping("queryUser")
    public CommonResult queryUser() {
        UserEntity userEntity = userService.getById(AuthUtils.getUserId());
        UserEntity r = new UserEntity();
        r.setId(userEntity.getId());
        r.setEmail(StrUtil.hide(userEntity.getEmail(), 3, 5));
        r.setPhone(DesensitizedUtil.mobilePhone(userEntity.getPhone()));
        r.setNickName(userEntity.getNickName());
        return CommonResult.success(r);
    }

    @PostMapping("updateUser")
    public CommonResult updateUser(@RequestBody UserEntity userEntity) {
        if (!userEntity.getId().equals(AuthUtils.getUserId())) {
            return CommonResult.failed("非法操作");
        }
        return CommonResult.success(userService.updateById(userEntity));
    }

    @GetMapping("sendMsg")
    public CommonResult sendMsg(@RequestParam("phone") String phone) {
        //判断是否和当前手机号一直
        UserEntity phoneUserEntity = new UserEntity();
        phoneUserEntity.setPhone(phone);
        if (userService.list(Wrappers.query(phoneUserEntity)).size() != 0) {
            return CommonResult.failed("新手机号已注册，不能重复使用");
        }

        String key = RedisConst.PHONE_UPDATE_CODE_STR + AuthUtils.getUserId();
        //校验是否发送过短信以免重复发送60秒只能发送一次
        if (redisUtil.hasKey(key)) {
            Long seconds = redisUtil.getExpire(key);
            if (seconds > 0) {
                return CommonResult.failed("已获取过短信，请等待" + seconds + "秒之后在获取");
            }
        }
        //获取四位随机数字
        String rom = cn.hutool.core.util.RandomUtil.randomNumbers(4);
        try {
            redisUtil.set(RedisConst.PHONE_UPDATE_CODE_STR + AuthUtils.getUserId(),
                    rom + "_" + phone, RedisConst.CODE_TIMEOUT);
        } catch (Exception e) {
            return CommonResult.failed("发送失败：" + e.getMessage());
        }
        return CommonResult.failed("发送失败未配置相关信息");
    }

    @GetMapping("updatePhone")
    public CommonResult updatePhone(@RequestParam("password") String password,
                                    @RequestParam("code") String code) {
        String key = RedisConst.PHONE_UPDATE_CODE_STR + AuthUtils.getUserId();
        Object smsStr = redisUtil.get(key);
        if (null == smsStr) {
            return CommonResult.failed("验证码错误");
        }
        String smsCode = String.valueOf(smsStr).split("_")[0];
        String phone = String.valueOf(smsStr).split("_")[1];
        if (!code.equals(smsCode)) {
            return CommonResult.failed("验证码错误");
        }
        UserEntity userEntityInfo = userService.getById(AuthUtils.getUserId());
        String md5Pwd = DigestUtil.md5Hex(userEntityInfo.getUsername().toLowerCase() + password);
        if (!userEntityInfo.getPassword().equals(md5Pwd)) {
            return CommonResult.failed(ResultCodeEnum.A5210.getMsg());
        }
        UserEntity userEntity = new UserEntity();
        userEntity.setId(AuthUtils.getUserId());
        userEntity.setPhone(phone);
        userService.updateById(userEntity);

        return CommonResult.success();
    }


    @GetMapping("updateEmail")
    public CommonResult updateEmail(@RequestParam("password") String password,
                                    @RequestParam("code") String code) {
        String key = RedisConst.EMAIL_UPDATE_CODE_STR + AuthUtils.getUserId();
        Object smsStr = redisUtil.get(key);
        if (null == smsStr) {
            return CommonResult.failed(ResultCodeEnum.A5204.getMsg());
        }
        String smsCode = String.valueOf(smsStr).split("_")[0];
        String email = String.valueOf(smsStr).split("_")[1];
        if (!code.equals(smsCode)) {
            return CommonResult.failed(ResultCodeEnum.A5204.getMsg());
        }
        UserEntity userEntityInfo = userService.getById(AuthUtils.getUserId());
        String md5Pwd = DigestUtil.md5Hex(userEntityInfo.getUsername().toLowerCase() + password);
        if (!userEntityInfo.getPassword().equals(md5Pwd)) {
            return CommonResult.failed(ResultCodeEnum.A5210.getMsg());
        }
        //验证成功开始更新数据
        UserEntity userEntity = new UserEntity();
        userEntity.setId(AuthUtils.getUserId());
        userEntity.setEmail(email);
        userService.updateById(userEntity);
        return CommonResult.success();
    }
}
