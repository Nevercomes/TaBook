package com.nevercome.tabook.modules.book.entity.favorite;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.book.entity.info.BookInfo;
import com.nevercome.tabook.modules.book.entity.user.Student;
import javafx.scene.chart.PieChart;
import lombok.Data;

/**
 * BookUserFavorite实体类
 * 包括收藏的图书、长书评
 * @author sun
 */
@Data
public class BookUserFavorite extends DataEntity<BookUserFavorite> {

    // 持久化数据
    private String type; // 书籍1 书评2
    private String bookClassId;
    private String bookCommentId;

    // 联结数据
    // 若需求字段少且固定 可根据客户端显示需求单独设置 在dao层直接查询 而不在service层单独添加
    private BookInfo bookInfo;
    private Student student;

}
