package io.github.lancelothuxi.mock.mock;

import com.alibaba.fastjson.JSON;
import io.github.lancelothuxi.mock.api.CommonDubboMockService;
import io.github.lancelothuxi.mock.api.MockRequest;
import io.github.lancelothuxi.mock.api.MockResponse;
import io.github.lancelothuxi.mock.domain.MockConfig;
import io.github.lancelothuxi.mock.service.IMockConfigService;
import io.github.lancelothuxi.mock.service.IMockDataService;
import org.simple.dto.PageResult;
import org.simple.utils.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

import static org.apache.commons.lang.ObjectUtils.defaultIfNull;

/**
 * 服务mock方法Controller
 *
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-09
 */
@Controller
@RequestMapping("/mock/dubbo/config")
public class MockConfigController {
    private String prefix = "mock/dubbo/config";

    @Autowired
    private IMockConfigService mockConfigService;

    @Autowired
    private IMockDataService mockDataService;

    @Autowired
    private CommonDubboMockService commonDubboMockService;

    @GetMapping()
    public String rule(MockConfig mockConfig, ModelMap modelMap) {
        modelMap.put("type", defaultIfNull(mockConfig.getType(), "dubbo"));
        return prefix + "/config";
    }

    /**
     * 查询服务mock方法列表
     */
    @PostMapping("/list")
    @ResponseBody
    public PageResult<MockConfig> list(MockConfig MockConfig) {
        List<MockConfig> list =
                mockConfigService.fuzzlySelectMockConfigList(MockConfig);
        PageResult<MockConfig> pageResult = new PageResult<>(list);
        pageResult.setTotal(list);
        return pageResult;
    }

    /**
     * 新增服务mock方法
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存服务mock方法
     */
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MockConfig MockConfig) {
        return success(mockConfigService.insertMockConfig(MockConfig));
    }

    /**
     * 修改服务mock方法
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        MockConfig MockConfig = mockConfigService.selectMockConfigById(id);
        mmap.put("mockConfig", MockConfig);
        return prefix + "/edit";
    }

    /**
     * 修改保存服务mock方法
     */
    @Log(title = "服务mock方法", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MockConfig MockConfig) {
        return toAjax(mockConfigService.updateMockConfig(MockConfig));
    }

    /**
     * 删除服务mock方法
     */
    @Log(title = "服务mock方法", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(mockConfigService.deleteMockConfigByIds(ids));
    }

    @PostMapping("/batchOpen")
    @ResponseBody
    public AjaxResult batchOpen(String ids) {
        String[] idArray = Convert.toStrArray(ids);
        for (String s : idArray) {
            MockConfig real = mockConfigService.selectMockConfigById(Long.valueOf(s));
            if (real != null) {
                real.setEnabled("1");
            }

            mockConfigService.updateMockConfig(real);
        }
        return AjaxResult.success();
    }

    @PostMapping("/batchClose")
    @ResponseBody
    public AjaxResult batchClose(String ids) {
        String[] idArray = Convert.toStrArray(ids);
        for (String s : idArray) {
            MockConfig real = mockConfigService.selectMockConfigById(Long.valueOf(s));
            if (real != null) {
                real.setEnabled("0");
            }

            mockConfigService.updateMockConfig(real);
        }
        return AjaxResult.success();
    }

    @PostMapping("/register")
    @ResponseBody
    public List<MockConfig> register(@RequestBody Request request) {

        logger.info("register mock config {}", JSON.toJSONString(request));

        ArrayList<MockConfig> arrayList = new ArrayList<MockConfig>();

        try {

            request.getMockConfigList().stream()
                    .forEach(
                            mockConfig -> {
                                mockConfig.setAppliactionName(request.getAppName());
                                mockConfig.setType(request.getType());
                                MockConfig dbConfig = mockConfigService.selectMockConfig(mockConfig);
                                if (null != dbConfig) {
                                    return;
                                }
                                Long id = mockConfigService.insertMockConfig(mockConfig);
                                mockConfig.setType(request.getType());
                                mockConfig.setId(id);
                                mockConfig.setEnabled("0");
                                arrayList.add(mockConfig);
                            });
        } catch (Exception ex) {
            logger.info("register mock config error {}", JSON.toJSONString(request), ex);
        }

        return arrayList;
    }

    /**
     * 查询服务mock方法列表
     */
    @PostMapping("/queryMockConfigData")
    @ResponseBody
    public MockResponse queryMockConfigData(@RequestBody MockRequest request) {
        return commonDubboMockService.doMockRequest(request);
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

    /**
     * 查询服务mock方法列表
     */
    @PostMapping("/directMatchSwitch")
    @ResponseBody
    public AjaxResult directMatchSwitch(MockConfig mockConfig) {
        return success(mockConfigService.updateMockConfig(mockConfig));
    }
}
