package io.github.lancelothuxi.mock.system.init;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.github.lancelothuxi.mock.system.entity.DictionaryEntity;
import io.github.lancelothuxi.mock.system.service.IDictionaryService;
import lombok.AllArgsConstructor;
import io.github.lancelothuxi.mock.utils.RedisUtil;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * redis数据初始化
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
//@Configuration
@AllArgsConstructor
public class RedisDataInit {

    private final RedisUtil redisUtil;
    private final IDictionaryService dictionaryService;


    @PostConstruct
    public void initData() {
        loadDictConfig();
    }

    private void loadDictConfig() {
        DictionaryEntity dictionaryEntity = new DictionaryEntity();
        dictionaryEntity.setValue("#");
        List<DictionaryEntity> dictionaryEntityList = dictionaryService.list(Wrappers.query(dictionaryEntity));
        if (dictionaryEntityList.size() != 0) {
            for (DictionaryEntity item : dictionaryEntityList) {
                DictionaryEntity d = new DictionaryEntity();
                d.setCode(item.getCode());
                List<DictionaryEntity> dicts =
                        dictionaryService.list(Wrappers.query(d).notIn("value", "#"));
                JSONArray array = new JSONArray();
                if (dicts.size() != 0) {
                    for (DictionaryEntity item1 : dicts) {
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("value", item1.getValue());
                        jsonObject.put("id", item1.getId());
                        jsonObject.put("label", item1.getLabel());
                        jsonObject.put("code", item1.getCode());
                        array.add(jsonObject);
                    }
                }
                redisUtil.set(item.getCode(), String.valueOf(array));
            }
        }
    }
}
