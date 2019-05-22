package com.nevercome.tabook.dao;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.modules.sys.dao.UserDao;
import com.nevercome.tabook.modules.sys.entity.User;
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

}
