package io.github.lancelothuxi.mock.k8s.config;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaMode;
import io.github.lancelothuxi.mock.domain.KubeConfig;
import io.github.lancelothuxi.mock.k8s.dto.KubeConfigQuery;
import io.github.lancelothuxi.mock.service.IKubeConfigService;
import io.swagger.v3.oas.annotations.Operation;
import org.simple.constant.CommonConst;
import org.simple.dto.PageResult;
import org.simple.utils.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * k8s管理Controller
 *
 * @author ruoyi
 * @date 2023-09-08
 */
@Controller
@RequestMapping("/k8s/config")
public class KubeConfigController {
    @Autowired
    private IKubeConfigService kubeConfigService;
    /**
     * 查询k8s管理列表
     */
    @PostMapping("/list")
    @ResponseBody
    public PageResult<KubeConfig> list(KubeConfigQuery kubeConfigQuery) {
        List<KubeConfig> list = kubeConfigService.queryForPage(kubeConfigQuery);
        PageResult<KubeConfig> pageResult = new PageResult<>(list);
        pageResult.setTotal(kubeConfigQuery.getTotal());
        return pageResult;
    }


    /**
     * 新增保存k8s管理
     */
    @PostMapping("/add")
    @ResponseBody
    public CommonResult addSave(KubeConfig kubeConfig) {
        kubeConfigService.save(kubeConfig);
        return CommonResult.success();
    }

    /**
     * 修改保存k8s管理
     */
    @PostMapping("/edit")
    @ResponseBody
    public CommonResult editSave(KubeConfig kubeConfig) {
        kubeConfigService.updateById(kubeConfig);
        return CommonResult.success();
    }


    @PostMapping("remove/{id}")
    public CommonResult remove(@PathVariable("id") Long id) {
        return CommonResult.success(kubeConfigService.removeById(id));
    }
}
