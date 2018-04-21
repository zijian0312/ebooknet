package com.lianshuwang.domin;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by ZhangZijian on 2017/4/25.
 */

/*
    class(Feedback) 反馈实体类
    id: 反馈编号
    loginedUser： 反馈用户（已登陆）
    contact： 联系方式
    suggestion： 建议
    postTime： 提交时间
    status: 状态
 */
public class Feedback implements Serializable {
    private int id;
    private long loginedUser;
    private String contact;
    private String suggestion;
    private Timestamp postTime;
    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getLoginedUser() {
        return loginedUser;
    }

    public void setLoginedUser(long loginedUser) {
        this.loginedUser = loginedUser;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }

    public Timestamp getPostTime() {
        return postTime;
    }

    public void setPostTime(Timestamp postTime) {
        this.postTime = postTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
