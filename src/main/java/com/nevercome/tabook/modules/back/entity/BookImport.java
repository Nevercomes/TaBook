package com.nevercome.tabook.modules.back.entity;

import com.nevercome.tabook.common.persistence.DataEntity;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import lombok.Data;

/**
 * @author: sun
 * @date: 2019/4/29
 */
@Data
public class BookImport  {
    private String name;
    private String author;
    private String ISBN;
    private String press;
    private String year;
    private String version;
    private float score;
    private String intro;
    private String imgUrl;

}
