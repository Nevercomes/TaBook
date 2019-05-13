package com.nevercome.tabook.modules.sys.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.nevercome.tabook.common.persistence.DataEntity;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 菜单Entity
 * @author ThinkGem
 * @version 2013-05-15
 */
public class Menu extends DataEntity<Menu> {

    private static final long serialVersionUID = 1L;
    private Menu parent;	// 父级菜单
    private String parentIds; // 所有父级编号
    private String name; 	// 名称
    private String href; 	// 链接
    private Integer sort; 	// 排序
    private String permission; // 权限标识

    private String userId;

    public Menu(){
        super();
        this.sort = 30;
    }

    public Menu(String id){
        super(id);
    }

    @JsonBackReference
    @NotNull
    public Menu getParent() {
        return parent;
    }

    public void setParent(Menu parent) {
        this.parent = parent;
    }

    @Length(min=1, max=2000)
    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    @Length(min=1, max=100)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Length(min=0, max=2000)
    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    @NotNull
    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Length(min=0, max=200)
    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getParentId() {
        return parent != null && parent.getId() != null ? parent.getId() : "0";
    }

    @JsonIgnore
    public static void sortList(List<Menu> list, List<Menu> sourceList, String parentId, boolean cascade){
        for (int i = 0; i< sourceList.size(); i++){
            Menu e = sourceList.get(i);
            if (e.getParent()!=null && e.getParent().getId()!=null
                    && e.getParent().getId().equals(parentId)){
                list.add(e);
                if (cascade){
                    // 判断是否还有子节点, 有则继续获取子节点
                    for (int j = 0; j< sourceList.size(); j++){
                        Menu child = sourceList.get(j);
                        if (child.getParent()!=null && child.getParent().getId()!=null
                                && child.getParent().getId().equals(e.getId())){
                            sortList(list, sourceList, e.getId(), true);
                            break;
                        }
                    }
                }
            }
        }
    }

    @JsonIgnore
    public static String getRootId(){
        return "1";
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
}
