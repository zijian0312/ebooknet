package com.lianshuwang.domin;

import java.io.Serializable;

/*
    class(Avatar) 用户头像实体类
    id:
    avatar_txt: 头像名称
    avatar_img: 头像地址
 */
public class Avatar implements Serializable{
    private int id;
    private String avatar_txt;
    private String avatar_img;

    public Avatar() {
    }

    public Avatar(int id, String avatar_txt, String avatar_img) {
        this.id = id;
        this.avatar_txt = avatar_txt;
        this.avatar_img = avatar_img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAvatar_txt() {
        return avatar_txt;
    }

    public void setAvatar_txt(String avatar_txt) {
        this.avatar_txt = avatar_txt;
    }

    public String getAvatar_img() {
        return avatar_img;
    }

    public void setAvatar_img(String avatar_img) {
        this.avatar_img = avatar_img;
    }

}
