package com.nevercome.tabook.modules.msg.dao.notice;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.msg.entity.notice.MsgNotice;
import org.apache.ibatis.annotations.Param;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@MyBatisDao
public interface MsgNoticeDao extends CrudDao<MsgNotice> {
    void updateRead(MsgNotice msgNotice);

    void updateRead(@Param("msgNoticeId") String msgNoticeId);
}
