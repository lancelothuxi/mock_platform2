package io.github.lancelothuxi.mock.system.dto.menu;

import com.alibaba.fastjson.JSONObject;
import lombok.Data;
import io.github.lancelothuxi.mock.dto.BaseTree;

import java.util.List;

/**
 * MenuTree
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/11/13
 */
@Data
public class MenuTreeDto extends BaseTree<MenuTreeDto> {
    private String path;
    private String component;
    private String label;
    private String value;
    private String icon;
    private String redirect;
    private JSONObject meta;
    private String sort;
    private List<MenuTreeDto> children;
}
