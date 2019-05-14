package com.nevercome.tabook.modules.msg.service.letter;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.msg.dao.letter.MsgNoticeLetterDao;
import com.nevercome.tabook.modules.msg.entity.letter.MsgNoticeLetter;
import com.nevercome.tabook.modules.msg.entity.like.MsgNoticeLike;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@Service
public class MsgNoticeLetterService extends CrudService<MsgNoticeLetterDao, MsgNoticeLetter> {
}
