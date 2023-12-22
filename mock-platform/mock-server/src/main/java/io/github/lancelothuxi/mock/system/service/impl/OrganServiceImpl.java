package io.github.lancelothuxi.mock.system.service.impl;

import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.lancelothuxi.mock.system.dto.organ.OrganTreeDto;
import io.github.lancelothuxi.mock.system.entity.OrganEntity;
import io.github.lancelothuxi.mock.system.mapper.OrganMapper;
import io.github.lancelothuxi.mock.system.service.IOrganService;
import io.github.lancelothuxi.mock.dto.PageModel;
import io.github.lancelothuxi.mock.utils.TreeUtil;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * BranchServiceImpl
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
@Service
public class OrganServiceImpl extends ServiceImpl<OrganMapper, OrganEntity> implements IOrganService {

    @Override
    public List<OrganTreeDto> queryTree(PageModel pageModel) {
        List<OrganTreeDto> data = baseMapper.queryOrganTree();
        List<OrganTreeDto> dataAll = data;
        if (StrUtil.isNotEmpty(pageModel.getSearchValue())) {
            data = data.stream().filter(t -> StrUtil.nullToEmpty(t.getName()).contains(pageModel.getSearchValue())).collect(Collectors.toList());
        }
        List<OrganTreeDto> treeData = JSONUtil.toList(TreeUtil.treeWhere(data, dataAll), OrganTreeDto.class);
        treeData = treeData.stream().sorted(Comparator.comparing(OrganTreeDto::getSort)).collect(Collectors.toList());
        return new TreeUtil<OrganTreeDto>().buildTree(treeData);
    }
}