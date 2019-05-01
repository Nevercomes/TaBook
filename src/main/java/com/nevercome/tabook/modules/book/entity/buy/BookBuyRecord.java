package com.nevercome.tabook.modules.book.entity.buy;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;
import lombok.Data;

/**
 * BookBuyRecord实体类
 * @author sun
 */
public class BookBuyRecord extends DataEntity<BookBuyRecord> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String requesterId;
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
}
