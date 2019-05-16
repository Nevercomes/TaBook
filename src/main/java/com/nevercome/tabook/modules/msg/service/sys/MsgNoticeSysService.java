package com.nevercome.tabook.modules.msg.service.sys;

import com.nevercome.tabook.common.config.Global;
import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.msg.dao.notice.MsgNoticeDao;
import com.nevercome.tabook.modules.msg.dao.sys.MsgNoticeSysDao;
import com.nevercome.tabook.modules.msg.entity.notice.MsgNotice;
import com.nevercome.tabook.modules.msg.entity.sys.MsgNoticeSys;
import com.nevercome.tabook.modules.msg.service.notice.MsgNoticeService;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import com.nevercome.tabook.modules.utils.MsgConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author: sun
 * @date: 2019/5/14
 */
@Service
public class MsgNoticeSysService extends CrudService<MsgNoticeSysDao, MsgNoticeSys> {

    @Autowired
    private MsgNoticeDao msgNoticeDao;

    @Override
    @Transactional
    public List<MsgNoticeSys> findList(MsgNoticeSys msgNoticeSys) {
        // 执行已读操作
        MsgNotice msgNotice = new MsgNotice();
        msgNotice.setUserId(UserUtils.getUser().getId());
        msgNotice.setType(MsgConstant.MSG_NOTICE_TYPE_SYS);
        msgNotice.setReadFlag(Global.YES);
        msgNotice.setReadTime(new Date());
        msgNoticeDao.updateRead(msgNotice);
        return super.dao.findList(msgNoticeSys);
    }
}
