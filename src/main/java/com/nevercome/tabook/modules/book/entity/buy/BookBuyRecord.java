package com.nevercome.tabook.modules.book.entity.buy;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;
import lombok.Data;

/**
 * BookBuyRecord实体类
 * @author sun
 */
@Data
public class BookBuyRecord extends DataEntity<BookBuyRecord> {

    // 持久化数据
    private String bookInstanceId;
    private String status; // 当前状态 经常变动 状态参数见BookConstant
    private String type;
    private String cancel;
    private String requesterWords;
    private String requesterWordsDone;
    private float requesterGiveScore;
    private String ownerWordsDone;
    private float ownerGiveScore;

    // 联结数据
    // 若需求字段少且固定 可根据客户端显示需求单独设置 在dao层直接查询 而不在service层单独添加
    private BookInfo bookInfo;
    private BookStudent bookStudent;

}
