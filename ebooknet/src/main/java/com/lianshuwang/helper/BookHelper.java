package com.lianshuwang.helper;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by ZhangZijian on 2017/4/18.
 */
public class BookHelper {
    private long id;
    private String title;
    private String author;
    private String pubYear;
    private int largeType;
    private int smallType;
    private String summary;
    private MultipartFile bookFile;
    private MultipartFile bookCover;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPubYear() {
        return pubYear;
    }

    public void setPubYear(String pubYear) {
        this.pubYear = pubYear;
    }

    public int getLargeType() {
        return largeType;
    }

    public void setLargeType(int largeType) {
        this.largeType = largeType;
    }

    public int getSmallType() {
        return smallType;
    }

    public void setSmallType(int smallType) {
        this.smallType = smallType;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public MultipartFile getBookFile() {
        return bookFile;
    }

    public void setBookFile(MultipartFile bookFile) {
        this.bookFile = bookFile;
    }

    public MultipartFile getBookCover() {
        return bookCover;
    }

    public void setBookCover(MultipartFile bookCover) {
        this.bookCover = bookCover;
    }
}
