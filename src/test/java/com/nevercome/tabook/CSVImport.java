package com.nevercome.tabook;

import com.google.common.collect.Lists;
import org.junit.Test;
import org.springframework.transaction.annotation.Transactional;

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
    public List<String> importCSV(File file) {
        List<String> dataList = Lists.newArrayList();
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(file));
            String line;
            while ((line = br.readLine()) != null) {
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
        String path = "D:\\Lovecode\\_MyProjects\\TaBook\\spider\\dou\\douban_250_2.csv";
        List<String> bookData = importCSV(path);
        System.out.println(bookData);
    }
}
