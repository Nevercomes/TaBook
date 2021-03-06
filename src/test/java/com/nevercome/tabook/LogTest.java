package com.nevercome.tabook;

import com.nevercome.tabook.modules.sys.entity.User;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author: sun
 * @date: 2019/4/5
 */
public class LogTest {
    private Logger logger = LoggerFactory.getLogger(getClass());

    // 为什么没有输出到配置的目录？
    // 因为配置的目录的相对路径是web容器启动之后的相对路径...
    // 它不是没有输出，而是在别的地方
    @Test
    public void logTest() {
        logger.info("I'm {} message", "info");
        logger.debug("I'm {} message", "debug");
        logger.warn("I'm {} message", "warn");
        logger.error("I'm {} message", "error");
    }

    @Test
    public void printTest() {
        User user = new User();
        user.setLoginName("sun");
        System.out.println(user);
    }
}
