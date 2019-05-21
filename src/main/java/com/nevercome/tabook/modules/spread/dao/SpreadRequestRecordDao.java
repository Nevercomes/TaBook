package com.nevercome.tabook.modules.spread.dao;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.annotation.MyBatisDao;
import com.nevercome.tabook.modules.spread.entity.SpreadRequestRecord;

/**
 * @author: sun
 * @date: 2019/5/21
 */
@MyBatisDao
public interface SpreadRequestRecordDao extends CrudDao<SpreadRequestRecord> {

    void updateStatus(SpreadRequestRecord spreadRequestRecord);

}
