package com.nevercome.tabook.modules.msg.dao.like;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.msg.entity.like.MsgNoticeLike;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@MyBatisDao
public interface MsgNoticeLikeDao extends CrudDao<MsgNoticeLike> {
}
