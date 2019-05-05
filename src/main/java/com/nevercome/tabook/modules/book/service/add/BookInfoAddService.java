package com.nevercome.tabook.modules.book.service.add;

import com.nevercome.tabook.common.service.CrudService;
import com.nevercome.tabook.common.utils.StringUtils;
import com.nevercome.tabook.modules.book.dao.add.BookInfoAddDao;
import com.nevercome.tabook.modules.book.entity.add.BookInfoAdd;
import com.nevercome.tabook.modules.book.entity.info.BookInfoClass;
import com.nevercome.tabook.modules.book.entity.info.BookInfoInstance;
import com.nevercome.tabook.modules.book.entity.info.BookInfoRoot;
import com.nevercome.tabook.modules.book.entity.user.BookStudent;
import com.nevercome.tabook.modules.book.service.info.BookInfoClassService;
import com.nevercome.tabook.modules.book.service.info.BookInfoRootService;
import com.nevercome.tabook.modules.book.service.info.BookInstanceService;
import com.nevercome.tabook.modules.sys.entity.User;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author: sun
 * @date: 2019/4/25
 */
@Service
public class BookInfoAddService extends CrudService<BookInfoAddDao, BookInfoAdd> {

    // service 注入
    @Autowired
    private BookInfoRootService bookInfoRootService;
    @Autowired
    private BookInfoClassService bookInfoClassService;
    @Autowired
    private BookInstanceService bookInstanceService;


    /**
     * 书籍信息的添加
     * 1. 有rootId classId 那么所有的数据都是自动生成的 | 系统中有这本书
     * 2. 有rootId 没有classId 那么name和author是锁定的 其它信息根据用户的填写来生成一个新的bookClass节点
     * 3. 没有rootId 代表系统中根本没有任何该书的记录 则生成一个新的bookRoot节点和bookClass节点
     * 4. 更新书籍添加的信息 包括ownerComment 新旧程度 标签
     */
    @Override
    @Transactional
    public void save(BookInfoAdd bookInfoAdd) {
        String bookRootId = bookInfoAdd.getBookRootId();
        String bookClassId = bookInfoAdd.getBookClassId();

        if (StringUtils.isBlank(bookRootId)) {
            BookInfoRoot bookInfoRoot = new BookInfoRoot();
            bookInfoRoot.setName(bookInfoAdd.getName());
            bookInfoRoot.setAuthor(bookInfoAdd.getAuthor());
            bookInfoRoot.setSorts(bookInfoAdd.getSorts());
            // 同时 保存分类映射
            bookInfoRootService.save(bookInfoRoot);
            bookInfoAdd.setBookRootId(bookInfoRoot.getId());

            BookInfoClass bookInfoClass = new BookInfoClass();
            bookInfoClass.setBookRootId(bookInfoRoot.getId());
            bookInfoClass.setPress(bookInfoAdd.getPress());
            bookInfoClass.setYear(bookInfoAdd.getYear());
            bookInfoClassService.save(bookInfoClass);
            bookInfoAdd.setBookClassId(bookInfoClass.getId());
        } else if (StringUtils.isBlank(bookClassId)) {
            BookInfoClass bookInfoClass = new BookInfoClass();
            bookInfoClass.setBookRootId(bookInfoAdd.getBookRootId());
            bookInfoClass.setPress(bookInfoAdd.getPress());
            bookInfoClass.setYear(bookInfoAdd.getYear());
            bookInfoClassService.save(bookInfoClass);
            bookInfoAdd.setBookClassId(bookInfoClass.getId());
        }
        if (StringUtils.isBlank(bookInfoAdd.getBookInstanceId())) {
            BookInfoInstance bookInfoInstance = new BookInfoInstance();
            User user = UserUtils.getUser();
            bookInfoInstance.setCampusId(user.getCampusId());
            bookInfoInstance.setSchoolId(user.getSchoolId());
            bookInfoInstance.setOwnerId(user.getSchoolId());
            bookInfoAdd.preInsert();
            super.dao.insert(bookInfoAdd);
            bookInfoInstance.setUserAddId(bookInfoAdd.getId());
            bookInfoInstance.setTagNameList(bookInfoAdd.getTagNameList());
            bookInfoInstance.setTags(bookInfoAdd.getTags());
            bookInstanceService.save(bookInfoInstance);
            bookInfoAdd.setBookInstanceId(bookInfoInstance.getId());
        }
        BookInfoInstance bookInfoInstance = bookInstanceService.get(bookInfoAdd.getBookInstanceId());
        if (bookInfoInstance != null) {
            bookInfoInstance.setTagNameList(bookInfoAdd.getTagNameList());
            bookInfoInstance.setTags(bookInfoAdd.getTags());
            bookInstanceService.save(bookInfoInstance);
        }
        super.save(bookInfoAdd);
    }

}
