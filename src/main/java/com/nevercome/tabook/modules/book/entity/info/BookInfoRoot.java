package com.nevercome.tabook.modules.book.entity.info;

import com.nevercome.tabook.common.persistence.DataEntity;
import lombok.Data;

import java.util.List;

/**
 * BookInfoRoot实体类
 * @author sun
 */
public class BookInfoRoot extends DataEntity<BookInfoRoot> {

    private static final long serialVersionUID = 1L;

    // 持久化数据
    private String name;
    private String author;
    private String representId; // bookClass代表root的id

    private List<String> sortNameList; // 分类 名
    private String sorts; // 分类 id ','分隔

    // 统计数据
    private String status; // root的当前状态 状态参数见BookConstant

    // 搜索参数

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getRepresentId() {
        return representId;
    }

    public void setRepresentId(String representId) {
        this.representId = representId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<String> getSortNameList() {
        return sortNameList;
    }

    public void setSortNameList(List<String> sortNameList) {
        this.sortNameList = sortNameList;
    }

    public String getSorts() {
        return sorts;
    }

    public void setSorts(String sorts) {
        this.sorts = sorts;
    }
}
