package io.github.lancelothuxi.mock.exception;

import io.github.lancelothuxi.mock.system.ResultCodeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 自定义异常封装
 *
 * @author lancelot
 * @version v1.0
 * @since 2022/7/11
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class CustomException extends Exception {

    /**
     * 异常编码
     */
    private Object errorCode;

    /**
     * 异常信息
     */
    private String errorMessage;

    /**
     * 自定义异常
     *
     * @param errorCode 异常编码
     */
    public CustomException(Object errorCode) {
        ResultCodeEnum codesEnum = ResultCodeEnum.fromCode(errorCode.toString());
        if (codesEnum != null) {
            this.errorCode = codesEnum.getCode();
            this.errorMessage = codesEnum.getMsg();
        } else {
            this.errorCode = ResultCodeEnum.FAILED.getCode();
            this.errorMessage = ResultCodeEnum.FAILED.getMsg();
        }
    }

    @Override
    public Throwable fillInStackTrace() {
        return this;
    }
}
