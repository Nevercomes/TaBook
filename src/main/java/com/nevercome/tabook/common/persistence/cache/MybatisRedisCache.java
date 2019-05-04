package com.nevercome.tabook.common.persistence.cache;

import com.nevercome.tabook.common.utils.StringUtils;
import org.apache.ibatis.cache.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;

import java.util.List;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * Redis作为Mybatis二级缓存的实现类
 *
 * @author: sun
 * @date: 2019/5/4
 */
public class MybatisRedisCache implements Cache {

    private Logger logger = LoggerFactory.getLogger(MybatisRedisCache.class);
    private final String id;
    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();

    private static JedisConnectionFactory jedisConnectionFactory;

    /**
     * 这个地方需要静态注入，这里通过中间类 MybatisRedisCacheTransfer 实现的
     *
     * @param jedisConnectionFactory
     */
    public static void setJedisConnectionFactory(JedisConnectionFactory jedisConnectionFactory) {
        MybatisRedisCache.jedisConnectionFactory = jedisConnectionFactory;
    }

    public MybatisRedisCache(final String id) {
        if (StringUtils.isBlank(id)) {
            throw new IllegalArgumentException("mybatis redis cache need an id.");
        }
        this.id = id;
        logger.debug("mybatis redis cache id: {}", id);
    }

    @Override
    public String getId() {
        return this.id;
    }

    @Override
    @SuppressWarnings("unchecked")
    public void putObject(Object key, Object value) {
        if (key == null) {
            logger.debug("mybatis redis cache put empty");
            return;
        }
        logger.debug("mybatis redis cache put. k={} value=", key, value);
        RedisConnection redisConnection = null;
        try {
            redisConnection = jedisConnectionFactory.getConnection();
            RedisSerializer serializer = new JdkSerializationRedisSerializer();
            redisConnection.set(serializer.serialize(key), serializer.serialize(value));

            // 将key保存到redis.list中
            redisConnection.lPush(serializer.serialize(id), serializer.serialize(value));
        } catch (SerializationException e) {
            logger.error("mybatis redis cache put exception. k=" + key + "v=" + value + " ", e);
        } finally {
            if (redisConnection != null) {
                redisConnection.close();
            }
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public Object getObject(Object key) {
        if (key == null) {
            return null;
        }
        logger.debug("mybatis redis cache get k={}", key);
        RedisConnection redisConnection = null;
        Object result = null;

        try {
            redisConnection = jedisConnectionFactory.getConnection();
            RedisSerializer serializer = new JdkSerializationRedisSerializer();
            result = serializer.deserialize(redisConnection.get(serializer.serialize(key)));
        } catch (SerializationException e) {
            logger.error("mybatis redis cache get exception k=" + key + "v=" + result + " ", e);
        } finally {
            if (redisConnection != null) {
                redisConnection.close();
            }
        }
        return result;
    }

    @Override
    @SuppressWarnings("unchecked")
    public Object removeObject(Object key) {
        if (key == null) {
            return null;
        }
        logger.debug("mybatis redis cache remove k={}", key);
        RedisConnection redisConnection = null;
        Object result = null;
        try {
            redisConnection = jedisConnectionFactory.getConnection();
            RedisSerializer serializer = new JdkSerializationRedisSerializer();
            // 将key值设置为过期
            result = redisConnection.expireAt(serializer.serialize(key), 0);

            // 将key值从redis.list中删除
            redisConnection.lRem(serializer.serialize(id), 0, serializer.serialize(key));
        } catch (SerializationException e) {
            logger.error("mybatis redis cache remove exception k=" + key + "v=" + result + " ", e);
        } finally {
            if (redisConnection != null) {
                redisConnection.close();
            }
        }
        return result;
    }

    /**
     * 清空缓存
     * flushCache="true" 的时候会调用这个地方
     */
    @Override
    @SuppressWarnings("unchecked")
    public void clear() {
        logger.debug("mybatis redis cache clear");
        RedisConnection redisConnection = null;

        try {
            redisConnection = jedisConnectionFactory.getConnection();
            RedisSerializer serializer = new JdkSerializationRedisSerializer();
            // 这里不可以直接redisConnection.flushDb() 会把整个redis缓存都删除掉 获取redis.list中保存的key值，遍历删除
            Long length = redisConnection.lLen(serializer.serialize(id));
            if (length == 0) {
                return;
            }
            List<byte[]> keyList = redisConnection.lRange(serializer.serialize(id), 0, length - 1);
            for (byte[] key : keyList) {
                redisConnection.expireAt(key, 0);
            }
            redisConnection.expireAt(serializer.serialize(id), 0);
            keyList.clear();
        } catch (SerializationException e) {
            logger.error("mybatis redis cache clear exception. ", e);
        } finally {
            if (redisConnection != null) {
                redisConnection.close();
            }
        }

    }

    @Override
    @SuppressWarnings("unchecked")
    public int getSize() {
        int result = 0;
        try {
            RedisConnection redisConnection = jedisConnectionFactory.getConnection();
            RedisSerializer serializer = new JdkSerializationRedisSerializer();
            Long length = redisConnection.lLen(serializer.serialize(id));
            result = StringUtils.toInteger(length);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return null;
    }
}
