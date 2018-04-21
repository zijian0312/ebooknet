package com.lianshuwang.domin;

import java.io.Serializable;
import java.util.Date;

/*
    class(Book) 书籍实体类
    id: 书籍编号
    book_title: 书籍标题
    book_title: 书籍作者
    book_pubYear: 出版时间
    book_summary: 书籍摘要
    type_id: 类型编号
    book_format: 书籍格式
    download_times: 下载次数
    book_file: 书籍存储地址
    book_cover: 封面存储地址
 */
public class Book implements Serializable {
    private long id;
    private String book_title;
    private String book_author;
    private Date book_pubYear;
    private String book_summary;
    private int type_id;
    private String book_format;
    private int download_times;
    private String book_file;
    private String book_cover;

    public Book() {
    }

    public Book(long id, String book_title, String book_author, Date book_pubYear, String book_summary, int type_id, String book_format, int download_times, String book_file, String book_cover) {
        this.id = id;
        this.book_title = book_title;
        this.book_author = book_author;
        this.book_pubYear = book_pubYear;
        this.book_summary = book_summary;
        this.type_id = type_id;
        this.book_format = book_format;
        this.download_times = download_times;
        this.book_file = book_file;
        this.book_cover = book_cover;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getBook_title() {
        return book_title;
    }

    public void setBook_title(String book_title) {
        this.book_title = book_title;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public Date getBook_pubYear() {
        return book_pubYear;
    }

    public void setBook_pubYear(Date book_pubYear) {
        this.book_pubYear = book_pubYear;
    }

    public String getBook_summary() {
        return book_summary;
    }

    public void setBook_summary(String book_summary) {
        this.book_summary = book_summary;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getBook_format() {
        return book_format;
    }

    public void setBook_format(String book_format) {
        this.book_format = book_format;
    }

    public int getDownload_times() {
        return download_times;
    }

    public void setDownload_times(int download_times) {
        this.download_times = download_times;
    }

    public String getBook_file() {
        return book_file;
    }

    public void setBook_file(String book_file) {
        this.book_file = book_file;
    }

    public String getBook_cover() {
        return book_cover;
    }

    public void setBook_cover(String book_cover) {
        this.book_cover = book_cover;
    }

}
