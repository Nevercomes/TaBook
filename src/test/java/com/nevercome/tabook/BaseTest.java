package com.nevercome.tabook;

import com.nevercome.tabook.modules.sys.entity.User;

public class BaseTest {

    public static void main(String[] args) {
        User user = new User();
        user.setName("hello");
        System.out.println(user);
    }

}
