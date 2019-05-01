package com.nevercome.tabook.modules.sys.service;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.sys.dao.IdentityDao;
import com.nevercome.tabook.modules.sys.entity.Identity;
import com.nevercome.tabook.modules.sys.entity.Role;
import com.nevercome.tabook.modules.sys.entity.User;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: sun
 * @date: 2019/5/1
 */
@Service
public class IdentityService extends CrudService<IdentityDao, Identity> {

    @Autowired
    private SystemService systemService;

    public boolean identify(Identity identity) {
        // 执行认证逻辑
        if (identifyRequest(identity)) {
            super.save(identity);
            User user = UserUtils.getUser();
            List<Role> roleList = user.getRoleList();
            Role role = systemService.getRoleByEnname("student");
            roleList.add(role);
            user.setRoleList(roleList);
            systemService.updateUserInfo(user);
            return true;
        } else {
            return false;
        }
    }

    private boolean identifyRequest(Identity identity) {
        return true;
    }

}
