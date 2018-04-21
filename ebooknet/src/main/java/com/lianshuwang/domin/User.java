package com.lianshuwang.domin;

import java.io.Serializable;
import java.util.Date;

/*
    class(User) 用户实体类
    id： 编号
    userCode: 用户账号
    userPassword： 用户密码
    userName： 用户密码
    email： 用户邮箱
    avatarNum： 头像编号
    contribution： 贡献积分
    creationDate： 创建日期
 */
public class User implements Serializable {

    private long id;
    private String userCode;
    private String userPassword;
    private String userName;
    private String email;
    private int avatarNum;
    private int contribution;
    private Date creationDate;

    public User() {
    }

    public User(long id, String userCode, String userPassword,
                String userName, String email, int avatar,
                int contribution, Date creationDate) {
        this.id = id;
        this.userCode = userCode;
        this.userPassword = userPassword;
        this.userName = userName;
        this.email = email;
        this.avatarNum = avatar;
        this.contribution = contribution;
        this.creationDate = creationDate;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAvatarNum() {
        return avatarNum;
    }

    public void setAvatarNum(int avatarNum) {  this.avatarNum = avatarNum; }

    public int getContribution() {
        return contribution;
    }

    public void setContribution(int contribution) {
        this.contribution = contribution;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
}
