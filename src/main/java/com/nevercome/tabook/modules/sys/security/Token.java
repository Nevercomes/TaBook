package com.nevercome.tabook.modules.sys.security;

import lombok.Data;

/**
 * 基于JWT的自定义Token类
 * @Author: sun
 * @Description:
 * @Date: 2019/4/4
 */
@Data
public class Token {
    private String token;

    public Token(String token) {
        this.token = token;
    }
}
