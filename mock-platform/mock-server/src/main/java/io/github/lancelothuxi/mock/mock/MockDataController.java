package io.github.lancelothuxi.mock.mock;

import io.github.lancelothuxi.mock.domain.MockConfig;
import io.github.lancelothuxi.mock.domain.MockData;
import io.github.lancelothuxi.mock.functions.CompoundVariable;
import io.github.lancelothuxi.mock.mock.dto.MockDataQuery;
import io.github.lancelothuxi.mock.service.IMockConfigService;
import io.github.lancelothuxi.mock.service.IMockDataService;
import org.apache.commons.lang3.StringUtils;
import io.github.lancelothuxi.mock.dto.PageResult;
import io.github.lancelothuxi.mock.utils.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * mock配置关联响应数据Controller
 * @author lancelot huxisuz@gmail.com
 * @since 2023-05-10
 */
@Controller
@RequestMapping("/mock/data")
public class MockDataController {
    private String prefix = "mock/data";

    @Autowired
    private IMockDataService mockDataService;

    @Autowired
    private IMockConfigService mockConfigService;


    @GetMapping()
    public String data(MockData mockData, ModelMap modelMap) {
        modelMap.put("mockConfigId", mockData.getMockConfigId());
        return prefix + "/data";
    }

    /**
     * 查询mock配置关联响应数据列表
     */
    @PostMapping("/list")
    @ResponseBody
    public PageResult<MockData> list(MockDataQuery mockDataQuery) {
        MockConfig mockConfig = mockConfigService.getById(mockDataQuery.getMockConfigId());
        List<MockData> list = mockDataService.queryForPage(mockDataQuery);
        if (list != null) {
            for (MockData data : list) {
                data.setApplicationName(mockConfig.getApplicationName());
            }
        }
        PageResult<MockData> pageResult = new PageResult<>(list);
        pageResult.setTotal(pageResult.getTotal());
        return pageResult;
    }


    /**
     * 新增mock配置关联响应数据
     */
    @GetMapping("/add")
    public String add(MockData mockData, ModelMap modelMap) {
        modelMap.put("mockConfigId", mockData.getMockConfigId());
        return prefix + "/add";
    }


    /**
     * 新增保存mock配置关联响应数据
     */
    @PostMapping("/add")
    @ResponseBody
    public CommonResult addSave(MockData mockData) {
        if (StringUtils.isEmpty(mockData.getData())) {
            return CommonResult.failed("数据不能为空");
        }

        try {
            CompoundVariable compoundVariable = new CompoundVariable();
            compoundVariable.setParameters(mockData.getData());
            compoundVariable.execute();
        } catch (Exception ex) {
            return CommonResult.failed("非法的函数：" + ex.getMessage());
        }
        mockDataService.save(mockData);
        return CommonResult.success();
    }

    /**
     * 修改mock配置关联响应数据
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        MockData mockData = mockDataService.selectMockDataById(id);
        mmap.put("mockData", mockData);
        return prefix + "/edit";
    }

    /**
     * 修改保存mock配置关联响应数据
     */
    @PostMapping("/edit")
    @ResponseBody
    public CommonResult editSave(MockData mockData) {
        if (StringUtils.isEmpty(mockData.getData())) {
            return CommonResult.failed("数据不能为空");
        }
        try {
            CompoundVariable compoundVariable = new CompoundVariable();
            compoundVariable.setParameters(mockData.getData());
            compoundVariable.execute();
        } catch (Exception ex) {
            return CommonResult.failed("非法的函数：" + ex.getMessage());
        }
        mockDataService.updateById(mockData);
        return CommonResult.success();
    }

    /**
     * 删除mock配置关联响应数据
     */
    @PostMapping("/remove")
    @ResponseBody
    public CommonResult remove(Long id) {
        mockDataService.removeById(id);
        return CommonResult.success();
    }

    @PostMapping("/changEnable")
    @ResponseBody
    public CommonResult changEnable(MockData mockData) {
        mockDataService.updateById(mockData);
        return CommonResult.success();
    }
}
