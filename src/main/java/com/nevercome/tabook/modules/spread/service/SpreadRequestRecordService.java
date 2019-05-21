package com.nevercome.tabook.modules.spread.service;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.modules.spread.dao.SpreadRequestRecordDao;
import com.nevercome.tabook.modules.spread.entity.SpreadRequestRecord;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/5/21
 */
@Service
public class SpreadRequestRecordService extends CrudService<SpreadRequestRecordDao, SpreadRequestRecord> {

    public void updateStatus(SpreadRequestRecord spreadRequestRecord) {
        super.dao.updateStatus(spreadRequestRecord);
    }

}
