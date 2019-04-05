package com.nevercome.tabook.modules.book.entity.comment;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.Student;
import lombok.Data;

/**
 * BookCommentReply实体类
 * @author sun
 */
@Data
public class BookCommentReply extends DataEntity<BookCommentReply> {
    private String bookCommentId;
    private String likeNum;
    private String schoolId;
    private String content;

    // 联结数据
    // 若需求字段少且固定 可根据客户端显示需求单独设置 在dao层直接查询 而不在service层单独添加
    private BookInfo bookInfo;
    private Student student;
}
