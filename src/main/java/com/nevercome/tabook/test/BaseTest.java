package com.nevercome.tabook.test;

import com.nevercome.tabook.modules.sys.dao.UserDao;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.*xml"})
public class BaseTest {

    @Autowired
    private UserDao userDao;

    @Before
    public void before() {

    }

    @After
    public void after() {

    }

    @Test
    public void test() {
//       userDao.get("123");
    }

}
