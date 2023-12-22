package io.github.lancelothuxi.mock.mock;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.github.lancelothuxi.mock.api.MockRequest;
import io.github.lancelothuxi.mock.api.MockResponse;
import io.github.lancelothuxi.mock.domain.MockConfig;
import io.github.lancelothuxi.mock.mock.dto.MockConfigQuery;
import io.github.lancelothuxi.mock.service.IMockConfigService;
import lombok.extern.slf4j.Slf4j;
import io.github.lancelothuxi.mock.dto.PageResult;
import io.github.lancelothuxi.mock.utils.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 服务mock方法Controller
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-09
 */
@Controller
@RequestMapping("/mock/config")
@Slf4j
public class MockConfigController {

    @Autowired
    private IMockConfigService mockConfigService;

    @Autowired
    private CommonMockService commonMockService;

    /**
     * 查询服务mock方法列表
     */
    @PostMapping("/list")
    @ResponseBody
    public PageResult<MockConfig> list(MockConfigQuery mockConfigQuery) {
        List<MockConfig> list = mockConfigService.queryForPage(mockConfigQuery);
        PageResult<MockConfig> pageResult = new PageResult<>(list);
        pageResult.setTotal(pageResult.getTotal());
        return pageResult;
    }

    /**
     * 新增保存服务mock方法
     */
    @PostMapping("/add")
    @ResponseBody
    public CommonResult<?> addSave(MockConfig mockConfig) {
        mockConfigService.save(mockConfig);
        return CommonResult.success();
    }


    /**
     * 修改保存服务mock方法
     */
    @PostMapping("/edit")
    @ResponseBody
    public CommonResult<?> editSave(MockConfig mockConfig) {
        mockConfigService.updateById(mockConfig);
        return CommonResult.success();
    }

    /**
     * 删除服务mock方法
     */
    @PostMapping("/remove")
    @ResponseBody
    public CommonResult<?> remove(Long id) {
        mockConfigService.removeById(id);
        return CommonResult.success();
    }


    @PostMapping("/register")
    @ResponseBody
    public List<MockConfig> register(@RequestBody Request request) {
        log.info("register mock config {}", JSON.toJSONString(request));
        ArrayList<MockConfig> arrayList = new ArrayList<MockConfig>();
        try {
            request.getMockConfigList()
                    .forEach(
                            mockConfig -> {
                                MockConfig dbConfig = mockConfigService.getOne(new LambdaQueryWrapper<MockConfig>()
                                        .eq(MockConfig::getApplicationName,mockConfig.getApplicationName())
                                        .eq(MockConfig::getInterfaceName,mockConfig.getInterfaceName())
                                        .eq(MockConfig::getMethodName,mockConfig.getMethodName())
                                        .eq(MockConfig::getGroupName,mockConfig.getGroupName())
                                );

                                if (null != dbConfig) {
                                    return;
                                }
                                mockConfigService.save(mockConfig);
                                mockConfig.setType(request.getType());
                                mockConfig.setId(mockConfig.getId());
                                mockConfig.setEnabled("0");
                                arrayList.add(mockConfig);
                            });
        } catch (Exception ex) {
            log.error("register mock config error {}", JSON.toJSONString(request), ex);
        }
        return arrayList;
    }

    /**
     * 查询服务mock方法列表
     */
    @PostMapping("/queryMockConfigData")
    @ResponseBody
    public MockResponse queryMockConfigData(@RequestBody MockRequest request) {
        return commonMockService.doMockRequest(request);
    }

    /**
     * 查询服务mock方法列表
     */
    @PostMapping("/changEnable")
    @ResponseBody
    public CommonResult changEnable(MockConfig mockConfig) {
        mockConfigService.updateById(mockConfig);
        return CommonResult.success();
    }
}
