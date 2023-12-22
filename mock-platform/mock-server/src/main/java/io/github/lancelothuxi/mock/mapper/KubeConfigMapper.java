package io.github.lancelothuxi.mock.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.github.lancelothuxi.mock.domain.KubeConfig;
import io.github.lancelothuxi.mock.domain.MockConfig;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * k8s管理Mapper接口
 *
 * @author ruoyi
 * @date 2023-09-08
 */
@Mapper
public interface KubeConfigMapper extends BaseMapper<KubeConfig> {
}
