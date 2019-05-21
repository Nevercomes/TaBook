package com.nevercome.tabook.modules.spread.web;

import com.nevercome.tabook.common.web.BaseController;
import com.nevercome.tabook.common.web.Result;
import com.nevercome.tabook.modules.spread.entity.SpreadRequestRecord;
import com.nevercome.tabook.modules.spread.service.SpreadRequestRecordService;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: sun
 * @date: 2019/5/21
 */
@Controller
@RequestMapping(value = "${adminPath}/spread/request")
public class SpreadRequestRecordController extends BaseController {

    @Autowired
    private SpreadRequestRecordService spreadRequestRecordService;

    @RequestMapping(value = "save")
//    @RequiresPermissions("spread:request:edit")
    private ResponseEntity save(SpreadRequestRecord spreadRequestRecord) {
        spreadRequestRecord.setOrgId(UserUtils.getUser().getStudentId());
        spreadRequestRecordService.save(spreadRequestRecord);
        return new ResponseEntity<>(new Result(), HttpStatus.OK);
    }

}
