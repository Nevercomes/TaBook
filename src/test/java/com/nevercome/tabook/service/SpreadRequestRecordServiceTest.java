package com.nevercome.tabook.service;

import com.nevercome.tabook.BaseTest;
import com.nevercome.tabook.modules.spread.entity.SpreadRequestRecord;
import com.nevercome.tabook.modules.spread.service.SpreadRequestRecordService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author: sun
 * @date: 2019/5/21
 */
public class SpreadRequestRecordServiceTest extends BaseTest {

    @Autowired
    private SpreadRequestRecordService spreadRequestRecordService;


    @Test
    @Transactional
    public void testSave() {
        SpreadRequestRecord spreadRequestRecord = new SpreadRequestRecord();
        spreadRequestRecordService.save(spreadRequestRecord);
    }

}
