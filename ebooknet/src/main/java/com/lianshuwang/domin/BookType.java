package com.lianshuwang.domin;

import java.io.Serializable;


/*
    class(BookType) 书籍类型实体类
    id: 书籍类型编号
    book_large_type： 主类型编号
    book_small_type: 子类型编号
    large_type_name: 主类型名称
    small_type_name: 子类型名称
 */
public class BookType implements Serializable{
    private int id;
    private int book_large_type;
    private int book_small_type;
    private String large_type_name;
    private String small_type_name;

    public BookType() {
    }

    public BookType(int id, int book_large_type, int book_small_type,
                    String large_type_name, String small_type_name) {
        this.id = id;
        this.book_large_type = book_large_type;
        this.book_small_type = book_small_type;
        this.large_type_name = large_type_name;
        this.small_type_name = small_type_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBook_large_type() {
        return book_large_type;
    }

    public void setBook_large_type(int book_large_type) {
        this.book_large_type = book_large_type;
    }

    public int getBook_small_type() {
        return book_small_type;
    }

    public void setBook_small_type(int book_small_type) {
        this.book_small_type = book_small_type;
    }

    public String getLarge_type_name() {
        return large_type_name;
    }

    public void setLarge_type_name(String large_type_name) {
        this.large_type_name = large_type_name;
    }

    public String getSmall_type_name() {
        return small_type_name;
    }

    public void setSmall_type_name(String small_type_name) {
        this.small_type_name = small_type_name;
    }
}
