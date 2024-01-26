package io.github.lancelothuxi.mock.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.github.lancelothuxi.mock.system.dto.dict.DictQuery;
import io.github.lancelothuxi.mock.system.entity.DictionaryEntity;

import java.util.List;

/**
 * DictionaryService
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
public interface IDictionaryService extends IService<DictionaryEntity> {

    List<DictionaryEntity> list(DictQuery query);
}
