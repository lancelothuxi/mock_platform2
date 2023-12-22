package io.github.lancelothuxi.mock.mock;

import io.github.lancelothuxi.mock.domain.MockConfig;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class Request {
    private String applicationName;
    private List<MockConfig> mockConfigList = new ArrayList<>();
    private String type;
}
