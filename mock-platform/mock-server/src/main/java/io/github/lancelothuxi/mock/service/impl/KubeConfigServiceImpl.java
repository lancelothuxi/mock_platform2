package io.github.lancelothuxi.mock.service.impl;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.lancelothuxi.mock.domain.KubeConfig;
import io.github.lancelothuxi.mock.k8s.dto.KubeConfigQuery;
import io.github.lancelothuxi.mock.mapper.KubeConfigMapper;
import io.github.lancelothuxi.mock.service.IKubeConfigService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * k8s管理Service业务层处理
 *
 * @author ruoyi
 * @date 2023-09-08
 */
@Service
public class KubeConfigServiceImpl extends ServiceImpl<KubeConfigMapper, KubeConfig> implements IKubeConfigService  {

    @Override
    public List<KubeConfig> queryForPage(KubeConfigQuery query) {
        LambdaQueryWrapper<KubeConfig> queryWrapper = new LambdaQueryWrapper<>();
        if (StrUtil.isNotEmpty(query.getName())) {
            queryWrapper.like(KubeConfig::getName, query.getName());
        }
        if (Objects.nonNull(query.getIsValid())) {
            queryWrapper.eq(KubeConfig::getIsValid, query.getIsValid());
        }
        Page<KubeConfig> page = new Page<>(query.getCurrent(), query.getPageSize());
        IPage<KubeConfig> iPage = this.page(page, queryWrapper);
        return query.setList(iPage.getRecords(), page.getTotal());
    }
}
