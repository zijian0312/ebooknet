package com.lianshuwang.helper;

/**
 * Created by ZhangZijian on 2017/4/22.
 */
public class RankingBook {
    private long id;
    private String bookName;
    private String uploadDate;
    private int download_times;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(String uploadDate) {
        this.uploadDate = uploadDate;
    }

    public int getDownload_times() {
        return download_times;
    }

    public void setDownload_times(int download_times) {
        this.download_times = download_times;
    }
}
