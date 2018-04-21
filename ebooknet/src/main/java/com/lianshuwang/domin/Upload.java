package com.lianshuwang.domin;

import java.io.Serializable;
import java.util.Date;

/*
    class(Upload) 上传信息实体类
    id： 编号
    uploader: 上传用户id
    uploadedBook: 上传书籍id
    uploadedDate: 上传日期
 */
public class Upload implements Serializable{
    private int id;
    private long uploader;
    private long uploadedBook;
    private Date uploadedDate;

    public Upload() {
    }

    public Upload(int id, long uploader, long uploadedBook, Date uploadedDate) {
        this.id = id;
        this.uploader = uploader;
        this.uploadedBook = uploadedBook;
        this.uploadedDate = uploadedDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getUploader() {
        return uploader;
    }

    public void setUploader(long uploader) {
        this.uploader = uploader;
    }

    public long getUploadedBook() {
        return uploadedBook;
    }

    public void setUploadedBook(long uploadedBook) {
        this.uploadedBook = uploadedBook;
    }

    public Date getUploadedDate() {
        return uploadedDate;
    }

    public void setUploadedDate(Date uploadedDate) {
        this.uploadedDate = uploadedDate;
    }
}
