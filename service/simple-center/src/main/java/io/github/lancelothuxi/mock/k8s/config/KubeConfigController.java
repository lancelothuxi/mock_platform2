package io.github.lancelothuxi.mock.k8s.config;

import io.github.lancelothuxi.mock.domain.KubeConfig;
import io.github.lancelothuxi.mock.service.IKubeConfigService;
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
    private String prefix = "k8s/config";

    @Autowired
    private IKubeConfigService kubeConfigService;

    @GetMapping()
    public String config() {
        return prefix + "/config";
    }

    /**
     * 查询k8s管理列表
     */
    @PostMapping("/list")
    @ResponseBody
    public PageResult list(KubeConfig kubeConfig) {
        List<KubeConfig> list = kubeConfigService.selectKubeConfigList(kubeConfig);
        PageResult<KubeConfig> pageResult = new PageResult<>(list);
        pageResult.setTotal(pageModel.getTotal());
        return pageResult;
    }


    /**
     * 新增k8s管理
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存k8s管理
     */
    @PostMapping("/add")
    @ResponseBody
    public CommonResult addSave(KubeConfig kubeConfig) {
        return toAjax(kubeConfigService.insertKubeConfig(kubeConfig));
    }

    /**
     * 修改k8s管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        KubeConfig kubeConfig = kubeConfigService.selectKubeConfigById(id);
        mmap.put("kubeConfig", kubeConfig);
        return prefix + "/edit";
    }

    /**
     * 修改保存k8s管理
     */
    @PostMapping("/edit")
    @ResponseBody
    public CommonResult editSave(KubeConfig kubeConfig) {
        return toAjax(kubeConfigService.updateKubeConfig(kubeConfig));
    }

    /**
     * 删除k8s管理
     */
    @PostMapping("/remove")
    @ResponseBody
    public CommonResult remove(String ids) {
        return toAjax(kubeConfigService.deleteKubeConfigByIds(ids));
    }
}
