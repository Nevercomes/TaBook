package com.nevercome.tabook.modules.msg.service.like;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.msg.dao.like.MsgNoticeLikeDao;
import com.nevercome.tabook.modules.msg.dao.notice.MsgNoticeDao;
import com.nevercome.tabook.modules.msg.entity.like.MsgNoticeLike;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@Service
public class MsgNoticeLikeService extends CrudService<MsgNoticeLikeDao, MsgNoticeLike> {
}
