package com.nevercome.tabook.modules.book.utils;

/**
 * Book模块主要常量
 * @author sun
 */
public class BookConstant {

    /**
     * 书籍Root状态 无书 即copyNum为0
     */
    public static final String BOOK_ROOT_STATUS_NOBOOK = "0";

    /**
     * 书籍Root状态 空闲 即有书可借
     */
    public static final String BOOK_ROOT_STATUS_FREE = "1";

    /**
     * 书籍Root状态 忙 表示所有书当前都处于外借状态
     */
    public static final String BOOK_ROOT_STATUS_BUSY = "2";


    /**
     * 书籍Class状态 无书 即copyNum为0
     */
    public static final String BOOK_CLASS_STATUS_NOBOOK = "0";

    /**
     * 书籍Class状态 空闲 即有书可借
     */
    public static final String BOOK_CLASS_STATUS_FREE = "1";

    /**
     * 书籍Class状态 忙 表示所有书当前都处于外借状态
     */
    public static final String BOOK_CLASS_STATUS_BUSY = "2";


    /**
     * 书籍Instance状态 空闲
     */
    public static final String BOOK_INSATNCE_STATUS_FREE = "1";

    /**
     * 书籍Instance状态 外借
     */
    public static final String BOOK_INSATNCE_STATUS_BUSY = "2";

    /**
     * 书籍Instance状态 归还确认等待中
     */
    public static final String BOOK_INSATNCE_STATUS_WAITING = "3";

    /**
     * 书籍Instance状态 超期未归还
     */
    public static final String BOOK_INSATNCE_STATUS_EXPIRE = "4";

    /**
     * 书籍Instance状态 坏 长期未归还
     */
    public static final String BOOK_INSATNCE_STATUS_BAD = "5";


    /**
     * 书籍Instance申请状态 从申请者的角度去看 申请中
     */
    public static final String BOOK_REQUEST_STATUS_REQUESTING = "1";

    /**
     * 书籍Instance申请状态 从申请者的角度去看 申请成功
     */
    public static final String BOOK_REQUEST_STATUS_SUCCESS = "2";

    /**
     * 书籍Instance申请状态 从申请者的角度去看 申请被拒绝
     */
    public static final String BOOK_REQUEST_STATUS_REJECTED = "3";

    /**
     * 书籍Instance申请状态 从申请者的角度去看 归还确认中
     */
    public static final String BOOK_REQUEST_STATUS_RETURNING = "4";

    /**
     * 书籍Instance申请状态 从申请者的角度去看 归还成功
     */
    public static final String BOOK_REQUEST_STATUS_OVER = "5";

    /**
     * 书籍Instance申请状态 从申请者的角度去看 归还被拒绝
     * 特殊状态
     */
    public static final String BOOK_REQUEST_STATUS_RETURN_REJECTED = "6";

    /**
     * 书籍Instance申请状态 从申请者的角度去看 进入归还延误期 归还申请发出 3天后还未确认
     * 特殊状态
     */
    public static final String BOOK_REQUEST_STATUS_RETURN_DELAY = "7";

    /**
     * 书籍Instance申请状态 从申请者的角度去看 超期
     * 特殊状态
     */
    public static final String BOOK_REQUEST_STATUS_RETURN_EXPIRE = "8";

    /**
     * 书籍Instance申请状态 从申请者的角度去看 取消
     * 特殊状态
     */
    public static final String BOOK_REQUEST_STATUS_CANCEL = "9";

}
