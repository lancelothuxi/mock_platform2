package io.github.lancelothuxi.mock.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.github.lancelothuxi.mock.system.dto.log.LogsQuery;
import io.github.lancelothuxi.mock.system.entity.LogsEntity;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * LogsService
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
public interface ILogsService extends IService<LogsEntity> {

    /**
     * 保存
     *
     * @param query 查询参数
     * @return 是否成功
     */
    List<LogsEntity> logsList(LogsQuery query);

    /**
     * 保存
     *
     * @param entity 当前信息
     * @return 是否成功
     */
    Boolean saveUpdate(LogsEntity entity);

    /**
     * 根据请求转化日志实体
     *
     * @param serviceName   方法注释
     * @param currentUserId 当前人id
     * @param duration      请求耗时
     * @param request       请求参数
     * @return 日志信息
     */
    LogsEntity getLogData(String serviceName, String currentUserId, String duration, HttpServletRequest request);
}
