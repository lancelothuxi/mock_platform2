package io.github.lancelothuxi.mock.config.handler;

import cn.dev33.satoken.exception.NotPermissionException;
import io.github.lancelothuxi.mock.exception.CustomException;
import io.github.lancelothuxi.mock.exception.FileException;
import io.github.lancelothuxi.mock.system.ResultCodeEnum;
import io.github.lancelothuxi.mock.utils.CommonResult;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 统一异常处理
 *
 * @author yh_liu
 * @version v1.0
 * @since 2022/7/11
 */
@RestControllerAdvice
public class GlobalExceptionHandler {


    /**
     * 自定义异常捕捉处理
     *
     * @param ex 异常信息
     * @return 统一结果
     */
    @ExceptionHandler(value = CustomException.class)
    public CommonResult customExceptionHandler(CustomException ex) {
        if (ex != null) {
            return CommonResult.failed(ex.getErrorMessage());
        }
        return CommonResult.failed();
    }

    /**
     * 文件操作异常捕捉处理
     *
     * @param ex 异常信息
     * @return 统一结果
     */
    @ExceptionHandler(value = FileException.class)
    public CommonResult fileExceptionHandler(FileException ex) {
        if (ex != null) {
            return CommonResult.failed(ex.getErrorMessage());
        }
        return CommonResult.failed();
    }



    /**
     * Sa-token 接口无权返回返回信息增强
     *
     * @param exception 异常
     * @return 返回
     */
    @ExceptionHandler(value = NotPermissionException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public CommonResult<?> handleNotPermissionException(NotPermissionException exception) {
        return CommonResult.failed(ResultCodeEnum.FORBIDDEN.getMsg());
    }

    /**
     * 断言异常
     *
     * @param exception 异常
     * @return 返回
     */
    @ExceptionHandler(value = IllegalArgumentException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public CommonResult<Boolean> illegalArgumentException(IllegalArgumentException exception) {
        return CommonResult.failed(ResultCodeEnum.ILLEGAL_ARGUMENT_EXCEPTION.getMsg());
    }
}
