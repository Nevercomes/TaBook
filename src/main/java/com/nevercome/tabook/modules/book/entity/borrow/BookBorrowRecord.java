package com.nevercome.tabook.modules.book.entity.borrow;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.Student;
import lombok.Data;

/**
 * BookBorrowRecord实体类
 * @author sun
 */
@Data
public class BookBorrowRecord extends DataEntity<BookBorrowRecord> {

    // 持久化数据
    private String bookInstanceId;
    private String status; // 当前状态 经常变动 状态参数见BookConstant
    private String type; // 类型 借书1 买书2
    private String cancel; // 申请撤销标志 未撤销0 撤销1
    private String requesterWords; // 申请者提交申请时的留言
    private String requesterWordsDone; // 申请者完成借书时对所有者评价与留言
    private float requesterGiveScore; // 申请者完成借书时对所有者的打分
    private String ownerWordsDone; // 所有者完成借书时对申请者的评价与留言
    private float ownerGiveScore; // 所有者完成借书时对申请者的打分

    // 联结数据
    // 若需求字段少且固定 可根据客户端显示需求单独设置 在dao层直接查询 而不在service层单独添加
    private BookInfo bookInfo;
    private Student student;
}
