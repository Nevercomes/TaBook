package com.nevercome.tabook.modules.book.entity.borrow;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;

/**
 * BookBorrowRecord实体类
 * @author sun
 */
public class BookBorrowRecord extends DataEntity<BookBorrowRecord> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String requesterId;
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
    private BookStudent bookStudent;

    // 查询数据
    private String ownerId;


    public String getRequesterId() {
        return requesterId;
    }

    public void setRequesterId(String requesterId) {
        this.requesterId = requesterId;
    }

    public String getBookInstanceId() {
        return bookInstanceId;
    }

    public void setBookInstanceId(String bookInstanceId) {
        this.bookInstanceId = bookInstanceId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCancel() {
        return cancel;
    }

    public void setCancel(String cancel) {
        this.cancel = cancel;
    }

    public String getRequesterWords() {
        return requesterWords;
    }

    public void setRequesterWords(String requesterWords) {
        this.requesterWords = requesterWords;
    }

    public String getRequesterWordsDone() {
        return requesterWordsDone;
    }

    public void setRequesterWordsDone(String requesterWordsDone) {
        this.requesterWordsDone = requesterWordsDone;
    }

    public float getRequesterGiveScore() {
        return requesterGiveScore;
    }

    public void setRequesterGiveScore(float requesterGiveScore) {
        this.requesterGiveScore = requesterGiveScore;
    }

    public String getOwnerWordsDone() {
        return ownerWordsDone;
    }

    public void setOwnerWordsDone(String ownerWordsDone) {
        this.ownerWordsDone = ownerWordsDone;
    }

    public float getOwnerGiveScore() {
        return ownerGiveScore;
    }

    public void setOwnerGiveScore(float ownerGiveScore) {
        this.ownerGiveScore = ownerGiveScore;
    }

    public BookInfo getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(BookInfo bookInfo) {
        this.bookInfo = bookInfo;
    }

    public BookStudent getBookStudent() {
        return bookStudent;
    }

    public void setBookStudent(BookStudent bookStudent) {
        this.bookStudent = bookStudent;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }
}
