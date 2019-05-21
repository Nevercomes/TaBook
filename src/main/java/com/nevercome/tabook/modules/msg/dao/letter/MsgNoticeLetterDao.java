package com.nevercome.tabook.modules.msg.dao.letter;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.msg.entity.letter.MsgNoticeLetter;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@MyBatisDao
public interface MsgNoticeLetterDao extends CrudDao<MsgNoticeLetter> {
}
