package io.github.lancelothuxi.mock.dto;

import lombok.Data;

import java.util.List;


/**
 * @author lancelot
 * @version v1.0
 * @since 2022/7/19
 */
@Data
public class PageModel {

    /**
     * 当前页数
     */
    private int current;

    /**
     * 每页多少条
     */
    private int pageSize = 20;

    /**
     * 默认查询
     */
    private String searchValue;

    /**
     * 排序字段
     */
    private String sortField;

    /**
     * 排序方式
     */
    private String sortOrder;

    /**
     * 总行数
     */
    private Long total;

    /**
     * 设置数据列表
     *
     * @param <T>     实体
     * @param list    数据列表
     * @param records 总行数
     * @return 数据列表
     */
    public <T> List<T> setList(List<T> list, long records) {
        this.total = records;
        return list;
    }
}
