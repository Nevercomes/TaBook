package com.nevercome.tabook.common.persistence;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.validation.constraints.NotNull;


import com.nevercome.tabook.common.utils.Reflections;
import com.nevercome.tabook.common.utils.StringUtils;

/**
 * 数据Entity类
 * @author ThinkGem
 * @version 2014-05-16
 */
public abstract class TreeEntity<T> extends DataEntity<T> {

    private static final long serialVersionUID = 1L;

    protected T parent;
    protected String parentIds;
    protected String name;
    protected Integer sort;

    public TreeEntity() {
        super();
        this.sort = 30;
    }

    public TreeEntity(String id) {
        super(id);
    }

    /**
     * 父对象，只能通过子类实现，父类实现mybatis无法读取
     * @return
     */
    @JsonBackReference
    @NotNull
    public abstract T getParent();

    /**
     * 父对象，只能通过子类实现，父类实现mybatis无法读取
     * @return
     */
    public abstract void setParent(T parent);

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getParentId() {
        String id = null;
        if (parent != null){
            id = (String)Reflections.getFieldValue(parent, "id");
        }
        return StringUtils.isNotBlank(id) ? id : "0";
    }
}
