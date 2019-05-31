package com.nevercome.tabook.common.web;

import lombok.Data;
import org.springframework.http.HttpStatus;

/**
 * 结果Entity
 *
 * @author: sun
 * @date: 2019/4/4
 */
//@Data
public class Result {

    private HttpStatus status;
    private String result;
    private String msg;
    private Object data;
    public static final String RESULT_SUCCESS = "success";
    public static final String RESULT_FAIL = "fail";

    /**
     * 默认请求成功 不返回任何消息和 数据
     */
    public Result() {
        this.status = HttpStatus.OK;
        this.result = RESULT_SUCCESS;
    }

    /**
     * 请求成功 设置返回的消息
     *
     * @param msg
     */
    public Result(String msg) {
        this.status = HttpStatus.OK;
        this.result = RESULT_SUCCESS;
        this.msg = msg;
    }

    /**
     * 请求成功 设置返回的数据
     *
     * @param obj
     */
    public Result(Object obj) {
        this.status = HttpStatus.OK;
        this.result = RESULT_SUCCESS;
        this.data = obj;
    }

    /**
     * 请求成功 返回消息 数据
     *
     * @param msg
     * @param object
     */
    public Result(String msg, Object object) {
        this.status = HttpStatus.OK;
        this.result = RESULT_SUCCESS;
        this.msg = msg;
        this.data = object;
    }

    /**
     * 设置请求结果 返回的消息
     *
     * @param httpStatus
     * @param result
     * @param msg
     */
    public Result(HttpStatus httpStatus, String result, String msg) {
        this.status = httpStatus;
        this.result = result;
        this.msg = msg;
    }

    /**
     * 设置请求结果 返回的消息 数据
     *
     * @param result
     * @param msg
     * @param object
     */
    public Result(HttpStatus httpStatus, String result, String msg, Object object) {
        this.status = httpStatus;
        this.result = result;
        this.msg = msg;
        this.data = object;
    }
}
