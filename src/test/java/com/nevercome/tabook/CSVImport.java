package com.nevercome.tabook;

import com.google.common.collect.Lists;
import com.nevercome.tabook.common.utils.IdGen;
import com.nevercome.tabook.common.utils.StringUtils;
import com.nevercome.tabook.modules.back.entity.BookImport;
import com.nevercome.tabook.modules.back.service.BookImportService;
import com.nevercome.tabook.modules.book.service.add.BookInfoAddService;
import com.nevercome.tabook.modules.sys.entity.User;
import com.nevercome.tabook.modules.sys.utils.UserUtils;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

/**
 * @author: sun
 * @date: 2019/4/29
 */
public class CSVImport extends BaseTest {

    @Autowired
    private BookInfoAddService bookInfoAddService;
    @Autowired
    private BookImportService bookImportService;

    @Before
    public void before() {
        User user = UserUtils.getUser();
        user.setId("fac59fc522b1411481cf3a99d17169ec");
    }

    public List<String> importCSV(File file) {
        List<String> dataList = Lists.newArrayList();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(file));
            String line;
            while ((line = br.readLine()) != null) {
//                System.out.println(line);
                dataList.add(line);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                    br = null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return dataList;
    }

    public List<String> importCSV(String filePath) {
        File file = new File(filePath);
        return importCSV(file);
    }

    @Test
    public void importBookData() {
        String path = "D:\\Lovecode\\_MyProjects\\TaBook\\spider\\dou\\douban_250_3.csv";
        List<String> bookData = importCSV(path);
        for (int i = 1; i < bookData.size(); i++) {
            String[] bookInfo = bookData.get(i).split(",");
            BookImport bookImport = new BookImport();
            bookImport.setName(bookInfo[1]);
            bookImport.setAuthor(bookInfo[4]);
            bookImport.setPress(bookInfo[5]);
            bookImport.setYear(bookInfo[6]);
            System.out.println(bookInfo[7].length());
            bookImport.setScore(StringUtils.toFloat(bookInfo[7]));
            if (bookInfo.length >= 9) {
                bookImport.setIntro(bookInfo[8]);
            }
            bookImport.setImgUrl(bookInfo[3]);
            bookImportService.save(bookImport);
        }
    }

    @Test
    public void getUUID() {
        System.out.println(IdGen.uuid());
    }
}
