package com.nevercome.tabook.common.service;

import com.nevercome.tabook.common.persistence.CrudDao;
import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.common.persistence.Page;
import com.nevercome.tabook.common.utils.Reflections;
import com.nevercome.tabook.common.utils.StringUtils;
import com.nevercome.tabook.modules.book.dao.info.BookInfoDao;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.info.BookInfoClass;
import com.nevercome.tabook.modules.book.entity.info.BookInfoInstance;
import com.nevercome.tabook.modules.book.entity.info.BookInfoRoot;
import com.nevercome.tabook.modules.book.service.info.BookInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Service基类
 *
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudDao<T>, T extends DataEntity<T>> extends BaseService {

    @Autowired
    private BookInfoDao bookInfoDao;

    /**
     * 持久层对象
     */
    @Autowired
    protected D dao;

    /**
     * 获取单条数据
     *
     * @param id
     * @return
     */
    public T get(String id) {
        return injectValue(dao.get(id));
    }

    /**
     * 获取单条数据
     *
     * @param entity
     * @return
     */
    public T get(T entity) {
        return injectValue(dao.get(entity));
    }

    /**
     * 查询列表数据
     *
     * @param entity
     * @return
     */
    public List<T> findList(T entity) {
        return injectValue(dao.findList(entity));
    }

    /**
     * 查询分页数据
     *
     * @param page   分页对象
     * @param entity
     * @return
     */
    public Page<T> findPage(Page<T> page, T entity) {
        entity.setPage(page);
        page.setList(injectValue(dao.findList(entity)));
        return page;
    }

    /**
     * 保存数据（插入或更新）
     *
     * @param entity
     */
    @Transactional(readOnly = false)
    public void save(T entity) {
        if (entity.getIsNewRecord()) {
            entity.preInsert();
            dao.insert(entity);
        } else {
            entity.preUpdate();
            dao.update(entity);
        }
    }

    /**
     * 删除数据
     *
     * @param entity
     */
    @Transactional(readOnly = false)
    public void delete(T entity) {
        dao.delete(entity);
    }

    private List<T> injectValue(List<T> list) {
        for (T t : list) {
            injectValue(t);
        }
        return list;
    }

    private T injectValue(T t) {
        Object bookInfoField = null;
        if (t != null) {
            bookInfoField = Reflections.getAccessibleField(t, "bookInfo");
        }
        if (bookInfoField != null) {
            Object bookInstanceIdField = Reflections.getAccessibleField(t, "bookInstanceId");
            Object bookClassField = Reflections.getAccessibleField(t, "bookClassId");
            Object bookRootField = Reflections.getAccessibleField(t, "bookRootId");
            Object bookInfo = Reflections.getFieldValue(t, "bookInfo");

            if (bookInstanceIdField != null && bookInfo == null) {
                String bookInstanceId = (String) Reflections.getFieldValue(t, "bookInstanceId");
                if (StringUtils.isNotBlank(bookInstanceId)) {
                    bookInfo = bookInfoDao.getByBookInstanceId(new BookInfo(new BookInfoInstance(bookInstanceId)));
                    Reflections.setFieldValue(t, "bookInfo", bookInfo);
                }
            }

            if (bookClassField != null && bookInfo == null) {
                String bookClassId = (String) Reflections.getFieldValue(t, "bookClassId");
                if (StringUtils.isNotBlank(bookClassId)) {
                    bookInfo = bookInfoDao.getByBookClassId(new BookInfo(new BookInfoClass(bookClassId)));
                    Reflections.setFieldValue(t, "bookInfo", bookInfo);
                }
            }

            if (bookRootField != null && bookInfo == null) {
                String bookRootId = (String) Reflections.getFieldValue(t, "bookRootId");
                if (StringUtils.isNotBlank(bookRootId)) {
                    bookInfo = bookInfoDao.getByBookRootId(new BookInfo((new BookInfoRoot(bookRootId))));
                    Reflections.setFieldValue(t, "bookInfo", bookInfo);
                }
            }
        }
        return t;
    }

}