package com.nevercome.tabook.dao;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.common.utils.SpringContextHolder;
import com.nevercome.tabook.modules.sys.dao.UserDao;
import com.nevercome.tabook.modules.sys.entity.User;
import com.nevercome.tabook.modules.sys.service.SystemService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author: sun
 * @date: 2019/5/22
 */
public class UserDaoTest extends BaseTest {

    @Autowired
    private UserDao userDao;

    private SystemService systemService;

    @Before
    public void before() {
        systemService = SpringContextHolder.getBean(SystemService.class);
    }

    @Test
    public void test() {
        System.out.println(userDao.getByLoginName(new User(null, "oGzwE0YrTYfXbAA7cT320xTgNN1w")));
    }

    @Test
    @Transactional
    @Rollback(false)
    public void testSave() {
        User user = new User();
        user.preInsert();
        user.setName("sun-1");
        user.setLoginName("sun-1");
        userDao.insert(user);
    }

    @Test
    @Transactional
    @Rollback(false)
    public void testWxLogin() {
        try {
            systemService.wxUserLogin("033ry5k01FVemW1wrzl01tG8k01ry5kt");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    @Transactional
    @Rollback(false)
    public void testUpdateWxInfo() {
        User user = new User();
        user.setId("166eb12d7be54d00a508b2b25b4886a9");
        user.setName("sun-200");
        user.setAvatarUrl("li");
        userDao.updateWxInfo(user);
    }

}
