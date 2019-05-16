package com.nevercome.tabook.service;

import com.google.common.collect.Lists;
import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.common.utils.IdGen;
import com.nevercome.tabook.modules.sys.dao.MenuDao;
import com.nevercome.tabook.modules.sys.dao.RoleDao;
import com.nevercome.tabook.modules.sys.entity.Menu;
import com.nevercome.tabook.modules.sys.entity.Role;
import com.nevercome.tabook.modules.sys.entity.User;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author: sun
 * @date: 2019/5/13
 */
public class MenuServiceTest extends BaseTest {

    @Autowired
    private MenuDao menuDao;
    @Autowired
    private RoleDao roleDao;

    private Menu menu = new Menu();
    private Menu parent = new Menu();
    private User admin = new User();

    @Before
    public void before() {
        admin.setId("admin@root@nature-parent");
        parent.setId("0");
        menu.setCreateBy(admin);
        menu.setUpdateBy(admin);
        menu.setCreateTime(new Date());
        menu.setUpdateTime(new Date());
        menu.setParent(parent);
        menu.setParentIds("0,");
        menu.setSort(30);
    }

    @Test
    public void saveMenu() {
        menu.setHref("");
        menu.setName("");
        menu.setPermission("");
        menuDao.insert(menu);
    }

    @Test
    @Transactional
    @Rollback(value = false)
    public void saveRoleMenu() {
        String[] names = {"书籍购买模块可购买查看权限", "书籍借阅模块可借阅查看权限"};
        String[] permissions = {"book:buy_able:view", "book:borrowable:edit"};
        for (int i = 0; i < names.length; i++) {
            menu.setId(IdGen.uuid());
            menu.setName(names[i]);
            menu.setPermission(permissions[i]);
            menuDao.insert(menu);
            List<Role> roleList = roleDao.findList(new Role());
//            Role q = new Role();
//            q.setEnname("user");
//            Role role = roleDao.getByEnname(q);
            List<Menu> menuList = Lists.newArrayList();
            menuList.add(menu);
            for (Role role : roleList) {
                role.setMenuList(menuList);
                roleDao.insertRoleMenu(role);
            }
        }
    }

    @Test
    @Transactional
    @Rollback(value = false)
    public void saveRoleMenu2() {
//        String[] names = {"书籍点赞模块查看权限", "书籍点赞模块修改权限"};
//        String[] permissions = {"book:like:view", "book:like:edit"};
//        for (int i = 0; i < names.length; i++) {
        menu.setId(IdGen.uuid());
        menu.setName("书籍短评模块查看权限");
        menu.setPermission("book:comment:short:view");
        menuDao.insert(menu);
//            List<Role> roleList = roleDao.findList(new Role());
        Role q = new Role();
        q.setEnname("user");
        Role role = roleDao.getByEnname(q);
        List<Menu> menuList = Lists.newArrayList();
        menuList.add(menu);
//            for (Role role : roleList) {
        role.setMenuList(menuList);
        roleDao.insertRoleMenu(role);
//            }
//        }
    }

}
