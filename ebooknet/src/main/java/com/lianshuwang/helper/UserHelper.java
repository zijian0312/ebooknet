package com.lianshuwang.helper;

import com.lianshuwang.domin.Avatar;
import com.lianshuwang.domin.Contribution;

import java.util.Date;

/**
 * Created by ZhangZijian on 2017/4/13.
 */
public class UserHelper {
    private long id;
    private String userCode;
    private String userName;
    private String email;
    private Avatar avatar;
    private int contributionValue;
    private Contribution contribution;
    private Date creationDate;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserCode() {
        return userCode;
    }

    public int getContributionValue() {
        return contributionValue;
    }

    public void setContributionValue(int contributionValue) {
        this.contributionValue = contributionValue;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
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

    public Avatar getAvatar() {
        return avatar;
    }

    public void setAvatar(Avatar avatar) {
        this.avatar = avatar;
    }

    public Contribution getContribution() {
        return contribution;
    }

    public void setContribution(Contribution contribution) {
        this.contribution = contribution;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

}
