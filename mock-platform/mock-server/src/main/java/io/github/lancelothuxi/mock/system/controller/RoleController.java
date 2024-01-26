package io.github.lancelothuxi.mock.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaMode;
import com.github.yitter.idgen.YitIdHelper;
import io.github.lancelothuxi.mock.system.dto.role.RoleQuery;
import io.github.lancelothuxi.mock.system.entity.RoleEntity;
import io.github.lancelothuxi.mock.system.entity.RoleMenuEntity;
import io.github.lancelothuxi.mock.system.service.IRoleService;
import lombok.AllArgsConstructor;
import io.github.lancelothuxi.mock.dto.IdsModel;
import io.github.lancelothuxi.mock.dto.PageResult;
import io.github.lancelothuxi.mock.exception.CustomException;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 角色管理
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
@RestController
@AllArgsConstructor
@RequestMapping("/center/system/role")
public class RoleController {
    private final IRoleService roleService;

    @GetMapping("list")
    @SaCheckPermission(value = {"system:role:query"}, mode = SaMode.OR)
    public PageResult<RoleEntity> list(RoleQuery query) {
        List<RoleEntity> list = roleService.list(query);
        PageResult<RoleEntity> pageResult = new PageResult<>(list);
        pageResult.setTotal(query.getTotal());
        return pageResult;
    }

    @GetMapping("allList")
    @SaCheckPermission(value = {"system:role:query"}, mode = SaMode.OR)
    public List<RoleEntity> allList() {
        return roleService.list();
    }

    @PostMapping("addRole")
    @SaCheckPermission(value = {"system:role:add"}, mode = SaMode.OR)
    public Boolean addRole(@RequestBody RoleEntity roleEntity) {
        roleEntity.setId(String.valueOf(YitIdHelper.nextId()));
        roleEntity.setStatus("0");
        roleEntity.setType("01");
        return roleService.save(roleEntity);
    }

    @PostMapping("editRole")
    @SaCheckPermission(value = {"system:role:edit"}, mode = SaMode.OR)
    public Boolean editRole(@RequestBody RoleEntity entity) {
        return roleService.updateById(entity);
    }

    @PostMapping("delRole")
    @SaCheckPermission(value = {"system:role:del"}, mode = SaMode.OR)
    public Boolean delRole(@RequestBody IdsModel model) throws CustomException {
        return roleService.delRole(model.getId());
    }

    @GetMapping("roleMenu")
    public List<String> roleMenu(@RequestParam("role") String role) {
        return roleService.queryRoleMenu(role);
    }

    @PostMapping("saveRoleMenu")
    @SaCheckPermission(value = {"system:role:edit"}, mode = SaMode.OR)
    public Boolean saveRoleMenu(@RequestBody RoleMenuEntity roleMenuEntity) {
        return roleService.insertRoleMenus(roleMenuEntity);
    }
}
