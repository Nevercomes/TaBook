package com.nevercome.tabook.modules.msg.service.letter;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.msg.dao.letter.MsgNoticeLetterDao;
import com.nevercome.tabook.modules.msg.dao.notice.MsgNoticeDao;
import com.nevercome.tabook.modules.msg.entity.letter.MsgNoticeLetter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@Service
public class MsgNoticeLetterService extends CrudService<MsgNoticeLetterDao, MsgNoticeLetter> {

    @Autowired
    private MsgNoticeDao msgNoticeDao;

    @Override
    public MsgNoticeLetter get(MsgNoticeLetter msgNoticeLetter) {
        msgNoticeLetter = super.dao.get(msgNoticeLetter);
        msgNoticeDao.updateRead(msgNoticeLetter.getId());
        return msgNoticeLetter;
    }

}
