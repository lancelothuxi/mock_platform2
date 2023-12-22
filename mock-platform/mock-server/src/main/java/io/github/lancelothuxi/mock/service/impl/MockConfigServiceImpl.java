package io.github.lancelothuxi.mock.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.lancelothuxi.mock.domain.MockConfig;
import io.github.lancelothuxi.mock.mapper.MockConfigMapper;
import io.github.lancelothuxi.mock.mock.dto.MockConfigQuery;
import io.github.lancelothuxi.mock.service.IMockConfigService;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 服务mock方法Service业务层处理
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-11
 */
@Service
public class MockConfigServiceImpl extends ServiceImpl<MockConfigMapper,MockConfig> implements IMockConfigService {

    @Override
    public boolean updateById(MockConfig entity) {
        return super.updateById(entity);
    }

    @Override
    public List<MockConfig> queryForPage(MockConfigQuery mockConfigQuery) {
        LambdaQueryWrapper<MockConfig> queryWrapper = new LambdaQueryWrapper<>();
        if (StrUtil.isNotEmpty(mockConfigQuery.getApplicationName())) {
            queryWrapper.like(MockConfig::getApplicationName, mockConfigQuery.getApplicationName());
        }
        if (StrUtil.isNotEmpty(mockConfigQuery.getInterfaceName())) {
            queryWrapper.like(MockConfig::getInterfaceName, mockConfigQuery.getInterfaceName());
        }
        if (StrUtil.isNotEmpty(mockConfigQuery.getMethodName())) {
            queryWrapper.like(MockConfig::getMethodName, mockConfigQuery.getMethodName());
        }
        if (StrUtil.isNotEmpty(mockConfigQuery.getGroupName())) {
            queryWrapper.like(MockConfig::getGroupName, mockConfigQuery.getGroupName());
        }
        if (StrUtil.isNotEmpty(mockConfigQuery.getVersion())) {
            queryWrapper.like(MockConfig::getVersion, mockConfigQuery.getVersion());
        }
        if (StrUtil.isNotEmpty(mockConfigQuery.getEnabled())) {
            queryWrapper.eq(MockConfig::getEnabled, mockConfigQuery.getEnabled());
        }

        if (StrUtil.isNotEmpty(mockConfigQuery.getType())) {
            queryWrapper.eq(MockConfig::getType, mockConfigQuery.getType());
        }

        Page<MockConfig> page = new Page<>(mockConfigQuery.getCurrent(), mockConfigQuery.getPageSize());
        IPage<MockConfig> iPage = this.page(page, queryWrapper);
        return mockConfigQuery.setList(iPage.getRecords(), page.getTotal());
    }

    @Override
    public MockConfig queryOne(MockConfig mockConfigQuery) {
        LambdaQueryWrapper<MockConfig> queryWrapper = new LambdaQueryWrapper<>();
        if (StrUtil.isNotEmpty(mockConfigQuery.getApplicationName())) {
            queryWrapper.eq(MockConfig::getApplicationName, mockConfigQuery.getApplicationName());
        }
        if (StrUtil.isNotEmpty(mockConfigQuery.getInterfaceName())) {
            queryWrapper.eq(MockConfig::getInterfaceName, mockConfigQuery.getInterfaceName());
        }
        if (StrUtil.isNotEmpty(mockConfigQuery.getMethodName())) {
            queryWrapper.eq(MockConfig::getMethodName, mockConfigQuery.getMethodName());
        }
        if (StrUtil.isNotEmpty(mockConfigQuery.getGroupName())) {
            queryWrapper.eq(MockConfig::getGroupName, mockConfigQuery.getGroupName());
        }
        if (StrUtil.isNotEmpty(mockConfigQuery.getVersion())) {
            queryWrapper.eq(MockConfig::getVersion, mockConfigQuery.getVersion());
        }
        if (StrUtil.isNotEmpty(mockConfigQuery.getEnabled())) {
            queryWrapper.eq(MockConfig::getEnabled, mockConfigQuery.getEnabled());
        }

        if (StrUtil.isNotEmpty(mockConfigQuery.getEnabled())) {
            queryWrapper.eq(MockConfig::getEnabled, mockConfigQuery.getEnabled());
        }

        if (StrUtil.isNotEmpty(mockConfigQuery.getType())) {
            queryWrapper.eq(MockConfig::getType, mockConfigQuery.getType());
        }

        return this.getOne(queryWrapper);
    }
}
