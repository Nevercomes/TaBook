package com.nevercome.tabook.modules.msg.dao.notice;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.msg.entity.notice.MsgNotice;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@MyBatisDao
public interface MsgNoticeDao extends CrudDao<MsgNotice> {
}
