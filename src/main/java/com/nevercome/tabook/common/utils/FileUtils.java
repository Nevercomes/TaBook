package com.nevercome.tabook.common.utils;

/**
 * @author: sun
 * @date: 2019/5/22
 */
public class FileUtils extends org.apache.commons.io.FileUtils {
    /**
     * 修复路径，将 \\ 或 / 等替换为 File.separator
     * @param path
     * @return
     */
    public static String path(String path){
        String p = StringUtils.replace(path, "\\", "/");
        p = StringUtils.join(StringUtils.split(p, "/"), "/");
        if (!StringUtils.startsWithAny(p, "/") && StringUtils.startsWithAny(path, "\\", "/")){
            p += "/";
        }
        if (!StringUtils.endsWithAny(p, "/") && StringUtils.endsWithAny(path, "\\", "/")){
            p = p + "/";
        }
        return p;
    }
}
