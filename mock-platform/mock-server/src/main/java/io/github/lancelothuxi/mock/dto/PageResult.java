package io.github.lancelothuxi.mock.dto;

import lombok.Data;

import java.util.List;


/**
 * @author lancelot
 * @version v1.0
 * @since 2022/7/19
 */
@Data
public class PageResult<T> {

    private static final long serialVersionUID = 41863970;

    /**
     * 总行数
     */
    private Long total;

    /**
     * 数据列表
     */
    private List<T> list;

    /**
     * 分页返回
     *
     * @param list 数据列表
     */
    public PageResult(List<T> list) {
        this.list = list;
    }
}
