package io.github.lancelothuxi.mock.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.github.lancelothuxi.mock.domain.KubeConfig;
import io.github.lancelothuxi.mock.k8s.dto.KubeConfigQuery;

import java.util.List;

/**
 * k8s管理Service接口
 *
 * @author ruoyi
 * @date 2023-09-08
 */
public interface IKubeConfigService extends IService<KubeConfig> {

    public List<KubeConfig> queryForPage(KubeConfigQuery kubeConfigQuery);
}
