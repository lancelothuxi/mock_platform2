package io.github.lancelothuxi.mock.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.github.lancelothuxi.mock.system.dto.fieldarea.FieldAreaFormVO;
import io.github.lancelothuxi.mock.system.entity.FieldAreaEntity;
import io.github.lancelothuxi.mock.dto.IdsModel;
import io.github.lancelothuxi.mock.dto.PageModel;

import java.util.List;

/**
 * @author ThePai
 * @version v1.0
 * @since 2022/8/7
 */
public interface IFieldAreaService extends IService<FieldAreaEntity> {

    /**
     * 查询所有列表
     *
     * @param pageModel 分页参数
     * @return 列表数据
     */
    List<FieldAreaEntity> list(PageModel pageModel);

    /**
     * 新增
     *
     * @param id 主键id
     * @return 是否成功
     */
    FieldAreaFormVO info(String id);

    /**
     * 保存
     *
     * @param entity 信息
     */
    void saveUpdate(FieldAreaFormVO entity);

    /**
     * 删除
     *
     * @param ids id数组
     */
    void delete(IdsModel ids);
}
