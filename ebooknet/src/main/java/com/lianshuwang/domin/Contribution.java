package com.lianshuwang.domin;

import java.io.Serializable;

/*
    class(Contribution) 等级信息实体类
    id: 等级类别编号
    lowerLimit: 每种等级最低分数
    upperLimit: 每种等级最高分数
    level_txt： 等级名称
    level_img： 等级标识图片
 */
public class Contribution implements Serializable{
    private int id;
    private int lowerLimit;
    private int upperLimit;
    private String level_txt;
    private String level_img;

    public Contribution() {
    }

    public Contribution(int id, int lowerLimit, int upperLimit,
                        String level_txt, String level_img) {
        this.id = id;
        this.lowerLimit = lowerLimit;
        this.upperLimit = upperLimit;
        this.level_txt = level_txt;
        this.level_img = level_img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMinValue() {
        return lowerLimit;
    }

    public void setMinValue(int lowerLimit) {
        this.lowerLimit = lowerLimit;
    }

    public int getMaxValue() {
        return upperLimit;
    }

    public void setMaxValue(int upperLimit) {
        this.upperLimit = upperLimit;
    }

    public String getLevel_txt() {
        return level_txt;
    }

    public void setLevel_txt(String level_txt) {
        this.level_txt = level_txt;
    }

    public String getLevel_img() {
        return level_img;
    }

    public void setLevel_img(String level_img) {
        this.level_img = level_img;
    }
}
