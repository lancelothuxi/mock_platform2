package io.github.lancelothuxi.mock.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.github.lancelothuxi.mock.system.dto.menu.MenuTreeDto;
import io.github.lancelothuxi.mock.system.dto.user.UserEntityDto;
import io.github.lancelothuxi.mock.system.dto.user.UserQuery;
import io.github.lancelothuxi.mock.system.entity.UserEntity;
import io.github.lancelothuxi.mock.utils.CommonResult;

import java.util.List;

/**
 * UserService
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
public interface IUserService extends IService<UserEntity> {
    /**
     * 查询当前用户菜单
     *
     * @param userId 用户id
     * @return 菜单权限合集
     */
    List<MenuTreeDto> getUserMenu(String userId);

    /**
     * 查询当前用户
     *
     * @param userName 用户账号
     * @return 用户信息
     */
    UserEntity getInfoByUserName(String userName);

    /**
     * 查询当前用户菜单
     *
     * @param userId 用户id
     * @return 菜单权限合集
     */
    List<String> getUserMenuAuth(String userId);

    /**
     * 查询当前用户角色
     *
     * @param userId 用户id
     * @return 角色编号合集
     */
    List<String> getUserRole(String userId);

    CommonResult delUser(String userId);

    void insertUserTenant(String id, String tenant, String user);

    void insertRoleUser(String id, String role, String user);

    List<UserEntityDto> listAll(UserQuery query);

    CommonResult updateUser(UserEntityDto userDto);
}
