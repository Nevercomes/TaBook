package com.nevercome.tabook;

import com.nevercome.tabook.modules.sys.dao.UserDao;
import com.nevercome.tabook.modules.sys.service.SystemService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml", "classpath:mybatis-config.xml", "classpath:spring-context-shiro.xml", "classpath:spring-context-jedis.xml"})
public class BaseTest {

    @Autowired
    private UserDao userDao;
    @Autowired
    private SystemService systemService;

    @Before
    public void before() {

    }

    @After
    public void after() {

    }

    @Test
    public void test() {
        userDao.get("123");
        systemService.getUser("1");
    }

}
