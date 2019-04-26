package com.nevercome.tabook.modules.book.service.add;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.common.utils.StringUtils;
import com.nevercome.tabook.modules.book.dao.add.BookInfoAddDao;
import com.nevercome.tabook.modules.book.entity.add.BookInfoAdd;
import com.nevercome.tabook.modules.book.entity.info.BookInfoRoot;
import org.springframework.stereotype.Service;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@Service
public class BookInfoAddService extends CrudService<BookInfoAddDao, BookInfoAdd> {

    /**
     * 书籍信息的添加
     * 1. 有rootId classId 那么所有的数据都是自动生成的 | 系统中有这本书
     * 2. 有rootId 没有classId 那么name和author是锁定的 其它信息根据用户的填写来生成一个新的bookClass节点
     * 3. 没有rootId 代表系统中根本没有任何该书的记录 则生成一个新的bookRoot节点和bookClass节点
     */
    @Override
    public void save(BookInfoAdd bookInfoAdd) {
        String bookRootId = bookInfoAdd.getBookRootId();
        String bookClassId = bookInfoAdd.getBookRootId();

        if (StringUtils.isBlank(bookRootId)) {
            BookInfoRoot bookInfoRoot = new BookInfoRoot();
            bookInfoRoot.setName(bookInfoAdd.getName());
            bookInfoRoot.setAuthor(bookInfoAdd.getAuthor());
        } else if (StringUtils.isBlank(bookClassId)) {

        } else {

        }
    }

}
