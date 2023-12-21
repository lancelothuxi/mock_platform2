package io.github.lancelothuxi.mock.mock;

import lombok.Data;

/**
 * @author lancelot
 * @version 1.0
 * @since 2023/6/17 下午12:35
 */
@Data
public class MockExpression {

    private String jsonPath = "";

    private String expectedValue = "";

}
