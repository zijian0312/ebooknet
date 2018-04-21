package com.lianshuwang.helper;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class doBookHelper {
    private long id;
    private String title;
    private String author;
    private String puYear;
    private int largeType;
    private int smallType;
    private String summary;
    private MultipartFile bookCover;
    private long uploader;
    private Date uploadedDate;

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

    public String getPuYear() {
        return puYear;
    }

    public void setPuYear(String puYear) {
        this.puYear = puYear;
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

    public MultipartFile getBookCover() {
        return bookCover;
    }

    public void setBookCover(MultipartFile bookCover) {
        this.bookCover = bookCover;
    }

    public long getUploader() {
        return uploader;
    }

    public void setUploader(long uploader) {
        this.uploader = uploader;
    }

    public Date getUploadedDate() {
        return uploadedDate;
    }

    public void setUploadedDate(Date uploadedDate) {
        this.uploadedDate = uploadedDate;
    }
}
