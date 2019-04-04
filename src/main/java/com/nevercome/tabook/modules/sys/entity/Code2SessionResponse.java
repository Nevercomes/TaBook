package com.nevercome.tabook.modules.sys.entity;

import lombok.Data;

/**
 * @description: 调用微信code2session API返回JSON的对象映射
 * @author: sun
 * @date: 2019/4/4
 */
@Data
public class Code2SessionResponse {
    private String openid;
    private String session_key;
    private String unionid;
    private String errcode = "0";
    private String errmsg;
    private int expires_in;
}
