package io.github.lancelothuxi.mock.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.github.lancelothuxi.mock.system.dto.organ.OrganTreeDto;
import io.github.lancelothuxi.mock.system.entity.OrganEntity;
import org.simple.dto.PageModel;

import java.util.List;


/**
 * 组织管理
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
public interface IOrganService extends IService<OrganEntity> {

    List<OrganTreeDto> queryTree(PageModel pageModel);

}