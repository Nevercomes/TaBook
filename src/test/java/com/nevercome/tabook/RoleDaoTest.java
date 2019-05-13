package com.nevercome.tabook;

import com.nevercome.tabook.modules.sys.dao.RoleDao;
import com.nevercome.tabook.modules.sys.entity.Role;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author: sun
 * @date: 2019/5/13
 */
public class RoleDaoTest extends BaseTest {

    @Autowired
    private RoleDao roleDao;

    private Role role = new Role();

    @Before
    public void before() {

    }

    @Test
    @Transactional
    public void saveRole() {

    }

}
