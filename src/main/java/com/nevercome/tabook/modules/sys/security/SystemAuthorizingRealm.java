package com.nevercome.tabook.modules.sys.security;

import com.nevercome.tabook.common.config.Global;
import com.nevercome.tabook.common.servlet.ValidateCodeServlet;
import com.nevercome.tabook.common.utils.Encodes;
import com.nevercome.tabook.common.utils.SpringContextHolder;
import com.nevercome.tabook.common.web.Servlets;
import com.nevercome.tabook.modules.sys.entity.Menu;
import com.nevercome.tabook.modules.sys.entity.Role;
import com.nevercome.tabook.modules.sys.entity.User;
import com.nevercome.tabook.modules.sys.service.SystemService;
import com.nevercome.tabook.modules.sys.utils.LogUtils;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import com.nevercome.tabook.modules.sys.web.LoginController;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.Serializable;
import java.util.Collection;

import java.util.List;

/**
 * 系统安全认证实现类
 *
 * @author sun
 * @author ThinkGem
 * @version 2014-7-5
 * @date 2019/4/4
 */
@Service
public class SystemAuthorizingRealm extends AuthorizingRealm {

    private SystemService systemService;

    private Logger logger = LoggerFactory.getLogger(getClass());

    public SystemAuthorizingRealm() {
        this.setCachingEnabled(false);
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;

//        int activeSessionSize = getSystemService().getSessionDao().getActiveSessions(false).size();
//        if (logger.isDebugEnabled()) {
//            logger.debug("login submit, active session size: {}, username: {}", activeSessionSize, token.getUsername());
//        }

        // 校验用户名密码
        String code = token.getUsername();
//        System.err.println(code);
        try {
            User user = getSystemService().wxUserLogin(code);
//            User user = getSystemService().retrieveUser("123", "123");
            if (Global.NO.equals(user.getLoginFlag())) {
                throw new AuthenticationException("msg:该帐号已禁止登录.");
            }
            // sun 不需要对密码进行加密和Hash
            SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo();
            simpleAuthenticationInfo.setPrincipals(new SimplePrincipalCollection(new Principal(user, true), getName()));
            simpleAuthenticationInfo.setCredentials(credentialsMatcher());
            return simpleAuthenticationInfo;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取权限授权信息，如果缓存中存在，则直接从缓存中获取，否则就重新获取， 登录成功后调用
     */
    protected AuthorizationInfo getAuthorizationInfo(PrincipalCollection principals) {
        if (principals == null) {
            return null;
        }
        AuthorizationInfo info = null;
        info = (AuthorizationInfo) UserUtils.getCache(UserUtils.CACHE_AUTH_INFO);
        if (info == null) {
            info = doGetAuthorizationInfo(principals);
            if (info != null) {
                UserUtils.putCache(UserUtils.CACHE_AUTH_INFO, info);
            }
        }
        return info;
    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Principal principal = (Principal) getAvailablePrincipal(principals);

        User user = getSystemService().getUserByLoginName(principal.getLoginName());
        if (user != null) {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            List<Menu> list = UserUtils.getMenuList();
            for (Menu menu : list) {
                if (StringUtils.isNotBlank(menu.getPermission())) {
                    // 添加基于Permission的权限信息
                    for (String permission : StringUtils.split(menu.getPermission(), ",")) {
                        info.addStringPermission(permission);
                    }
                }
            }
            // 添加用户权限
            info.addStringPermission("user");
            // 添加用户角色信息
            for (Role role : user.getRoleList()) {
                info.addRole(role.getEnname());
            }
            // 更新登录IP和时间
            getSystemService().updateUserLoginInfo(user);
            // 记录登录日志
            LogUtils.saveLog(Servlets.getRequest(), "系统登录");
            return info;
        } else {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            info.addStringPermission("user");
            return info;

        }
    }

    @Override
    protected void checkPermission(Permission permission, AuthorizationInfo info) {
        authorizationValidate(permission);
        super.checkPermission(permission, info);
    }

    @Override
    protected boolean[] isPermitted(List<Permission> permissions, AuthorizationInfo info) {
        if (permissions != null && !permissions.isEmpty()) {
            for (Permission permission : permissions) {
                authorizationValidate(permission);
            }
        }
        return super.isPermitted(permissions, info);
    }

    @Override
    public boolean isPermitted(PrincipalCollection principals, Permission permission) {
        authorizationValidate(permission);
        return super.isPermitted(principals, permission);
    }

    @Override
    protected boolean isPermittedAll(Collection<Permission> permissions, AuthorizationInfo info) {
        if (permissions != null && !permissions.isEmpty()) {
            for (Permission permission : permissions) {
                authorizationValidate(permission);
            }
        }
        return super.isPermittedAll(permissions, info);
    }

    /**
     * 授权验证方法
     *
     * @param permission
     */
    private void authorizationValidate(Permission permission) {
        // 模块授权预留接口
    }

    /**
     * 设定密码校验的Hash算法与迭代次数
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        setCredentialsMatcher(credentialsMatcher());
    }


    private CredentialsMatcher credentialsMatcher() {
        return (token, info) -> true;
    }


    /**
     * 获取系统业务对象
     */
    public SystemService getSystemService() {
        if (systemService == null) {
            systemService = SpringContextHolder.getBean(SystemService.class);
        }
        return systemService;
    }

    /**
     * 授权用户信息
     */
    public static class Principal implements Serializable {

        private static final long serialVersionUID = 1L;

        private String id; // 编号
        private String loginName; // 登录名
        private String name; // 姓名
        private boolean mobileLogin; // 是否手机登录


        public Principal(User user, boolean mobileLogin) {
            this.id = user.getId();
            this.loginName = user.getLoginName();
            this.name = user.getName();
            this.mobileLogin = mobileLogin;
        }

        public String getId() {
            return id;
        }

        public String getLoginName() {
            return loginName;
        }

        public String getName() {
            return name;
        }

        public boolean isMobileLogin() {
            return mobileLogin;
        }

        /**
         * 获取SESSIONID
         */
        public String getSessionid() {
            try {
                return (String) UserUtils.getSession().getId();
            } catch (Exception e) {
                return "";
            }
        }

        @Override
        public String toString() {
            return id;
        }
    }
}
