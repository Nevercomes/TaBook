package com.nevercome.tabook.modules.sys.service;

import com.google.common.collect.Lists;
import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;
import com.nevercome.tabook.modules.book.service.user.BookStudentService;
import com.nevercome.tabook.modules.sys.dao.IdentityDao;
import com.nevercome.tabook.modules.sys.dao.UserDao;
import com.nevercome.tabook.modules.sys.entity.Identity;
import com.nevercome.tabook.modules.sys.entity.Role;
import com.nevercome.tabook.modules.sys.entity.User;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author: sun
 * @date: 2019/5/1
 */
@Service
public class IdentityService extends CrudService<IdentityDao, Identity> {

    @Autowired
    private SystemService systemService;
    @Autowired
    private BookStudentService bookStudentService;

    @Autowired
    private UserDao userDao;

    @Transactional
    public boolean identify(Identity identity) {
        // 执行认证逻辑
        if (identifyRequest(identity)) {
            super.save(identity);
            User user = UserUtils.getUser();
            List<Role> roleList = user.getRoleList();
            Role role = systemService.getRoleByEnname("student");
            roleList.add(role);
            user.setRoleList(roleList);
//            systemService.updateUserInfo(user);
            // 为认证的user添加student Role
            User userRole = new User();
            userRole.setId(user.getId());
            List<Role> userRoleList = Lists.newArrayList();
            userRoleList.add(role);
            userRole.setRoleList(userRoleList);
            userDao.insertUserRole(userRole);
            // 插入一个Student
            BookStudent student = new BookStudent();
            student.setUserId(user.getId());
            student.setSchoolId(identity.getSchoolId());
            bookStudentService.save(student);
            return true;
        } else {
            return false;
        }
    }

    private boolean identifyRequest(Identity identity) {
        return true;
    }

}
