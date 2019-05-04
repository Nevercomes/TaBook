package com.nevercome.tabook.common.persistence.cache;

import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;

/**
 * mybatis redis 二级缓存参数传递
 * @author: sun
 * @date: 2019/5/4
 */
public class MybatisRedisCacheTransfer {

    public void setJedisConnectionFactory(JedisConnectionFactory jedisConnectionFactory) {
        MybatisRedisCache.setJedisConnectionFactory(jedisConnectionFactory);
    }

}
