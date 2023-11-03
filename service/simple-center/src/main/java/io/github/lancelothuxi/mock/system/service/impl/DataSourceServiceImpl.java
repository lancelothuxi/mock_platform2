package io.github.lancelothuxi.mock.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.github.lancelothuxi.mock.system.entity.DataSourceEntity;
import io.github.lancelothuxi.mock.system.mapper.DataSourceMapper;
import io.github.lancelothuxi.mock.system.service.IDataSourceService;
import org.springframework.stereotype.Service;

/**
 * DataSourceServiceImpl
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/11/13
 */
@Service
public class DataSourceServiceImpl extends ServiceImpl<DataSourceMapper, DataSourceEntity> implements IDataSourceService {
}
