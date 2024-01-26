package io.github.lancelothuxi.mock.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaMode;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.github.yitter.idgen.YitIdHelper;
import io.github.lancelothuxi.mock.system.dto.menu.MenuQuery;
import io.github.lancelothuxi.mock.system.dto.menu.MenuTreeDto;
import io.github.lancelothuxi.mock.system.entity.MenuEntity;
import io.github.lancelothuxi.mock.system.service.IMenuService;
import lombok.AllArgsConstructor;
import io.github.lancelothuxi.mock.dto.IdsModel;
import io.github.lancelothuxi.mock.dto.PageResult;
import io.github.lancelothuxi.mock.utils.CommonResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜单管理
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
@RestController
@AllArgsConstructor
@RequestMapping("/center/system/menu")
public class MenuController {
    private final IMenuService menuService;

    @GetMapping("treeAll")
    @SaCheckPermission(value = {"center:menu:query"}, mode = SaMode.OR)
    public List<MenuTreeDto> getTreeMenuAll() {
        return menuService.getTreeMenuAll();
    }

    @GetMapping("roleTreeAll")
    public List<MenuTreeDto> getRoleTreeAll() {
        return menuService.getRoleMenuAll();
    }

    @GetMapping("menuList")
    @SaCheckPermission(value = {"center:menu:query"}, mode = SaMode.OR)
    public PageResult<MenuEntity> getMenuList(MenuQuery query) {
        List<MenuEntity> list = menuService.list(query);
        PageResult<MenuEntity> pageResult = new PageResult<>(list);
        pageResult.setTotal(query.getTotal());
        return pageResult;
    }

    @GetMapping("btnList")
    public List<MenuEntity> getBtnList(@RequestParam("id") String id) {
        MenuEntity m = new MenuEntity();
        m.setParentId(id);
        m.setType("b");
        return menuService.list(Wrappers.query(m));
    }

    @PostMapping("addMenu")
    @SaCheckPermission(value = {"center:menu:add"}, mode = SaMode.OR)
    public CommonResult addMenu(@RequestBody MenuEntity menuEntity) {
        //重新组装菜单信息表
        menuEntity.setId(String.valueOf(YitIdHelper.nextId()));
        menuEntity.setType("c");
        menuEntity.setStatus("0");
        menuService.save(menuEntity);
        return CommonResult.success();
    }

    @PostMapping("editMenu")
    @SaCheckPermission(value = {"center:menu:edit"}, mode = SaMode.OR)
    public CommonResult editMenu(@RequestBody MenuEntity menuEntity) {
        //重新组装菜单信息表
        menuService.updateById(menuEntity);
        return CommonResult.success();
    }

    @PostMapping("delMenu")
    @SaCheckPermission(value = {"center:menu:del"}, mode = SaMode.OR)
    public CommonResult delMenu(@RequestBody IdsModel IdsModel) {
        menuService.delMenu(IdsModel.getId());
        return CommonResult.success();
    }

    @PostMapping("addBtnMenu")
    @SaCheckPermission(value = {"system:menu:add"}, mode = SaMode.OR)
    public CommonResult addBtnMenu(@RequestBody MenuEntity menuEntity) {
        menuEntity.setId(String.valueOf(YitIdHelper.nextId()));
        menuEntity.setStatus("0");
        menuEntity.setType("b");
        menuService.save(menuEntity);
        return CommonResult.success();

    }

    @PostMapping("editBtnMenu")
    @SaCheckPermission(value = {"center:menu:edit"}, mode = SaMode.OR)
    public CommonResult editBtnMenu(@RequestBody MenuEntity menuEntity) {
        menuService.updateById(menuEntity);
        return CommonResult.success();
    }

    @PostMapping("delBtnMenu")
    @SaCheckPermission(value = {"center:menu:del"}, mode = SaMode.OR)
    public CommonResult delBtnMenu(@RequestBody IdsModel idsModel) {
        menuService.delBtnMenu(idsModel.getId());
        return CommonResult.success();
    }
}
