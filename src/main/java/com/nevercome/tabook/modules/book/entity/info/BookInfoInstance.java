package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.add.BookInfoAdd;
import lombok.Data;

import java.util.List;

/**
 * BookInfoInstance实体类
 * @author sun
 */
public class BookInfoInstance extends DataEntity<BookInfoInstance> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String bookClassId;
    private String userAddId; // 添加记录的id
    private String ownerId; // 所有者id
    private String holderId; // 当前持有者id
    private String status; // 书籍实体的状态 状态参数见BookConstant
    private List<String> tagNameList;
    private String tags;

    // 统计数据
    private int totalBorrowed; // 书籍累计借阅
    private int likeNum; // 书籍获赞数

    // 链接数据
    private String ownerName;
    private String ownerAvatar;

    private BookInfoAdd bookInfoAdd;


    // 搜索参数


    public BookInfoInstance() {
    }

    public BookInfoInstance(String id) {
        super(id);
    }

    public String getBookClassId() {
        return bookClassId;
    }

    public void setBookClassId(String bookClassId) {
        this.bookClassId = bookClassId;
    }

    public String getUserAddId() {
        return userAddId;
    }

    public void setUserAddId(String userAddId) {
        this.userAddId = userAddId;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public String getHolderId() {
        return holderId;
    }

    public void setHolderId(String holderId) {
        this.holderId = holderId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTotalBorrowed() {
        return totalBorrowed;
    }

    public void setTotalBorrowed(int totalBorrowed) {
        this.totalBorrowed = totalBorrowed;
    }

    public int getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(int likeNum) {
        this.likeNum = likeNum;
    }

    public List<String> getTagNameList() {
        return tagNameList;
    }

    public void setTagNameList(List<String> tagNameList) {
        this.tagNameList = tagNameList;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getOwnerAvatar() {
        return ownerAvatar;
    }

    public void setOwnerAvatar(String ownerAvatar) {
        this.ownerAvatar = ownerAvatar;
    }

    public BookInfoAdd getBookInfoAdd() {
        return bookInfoAdd;
    }

    public void setBookInfoAdd(BookInfoAdd bookInfoAdd) {
        this.bookInfoAdd = bookInfoAdd;
    }
}
