package com.lianshuwang.helper;

import java.io.Serializable;

/**
 * Created by ZhangZijian on 2017/4/23.
 */
public class PageHelper implements Serializable {
    private int pageSize = 12;   //每页显示的书本数量
    private int currentPage = 1;        //当前页码数(从url中获取到)
    private int startRow = 1;           //每页开始的书本对应的记录行数(由当前页码数计算得到)
    private int totalPage;              //总页码数(由总记录数计算得到)
    private int totalRows;              //总记录数(从数据库中查询得到)

    public int getPageSize() {
        return pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getStartRow() {
        this.startRow = (this.currentPage - 1) * pageSize;
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public int getTotalPage() {
        if (this.totalRows % pageSize == 0) {
            this.totalPage = this.totalRows / pageSize;
        } else {
            this.totalPage = this.totalRows / pageSize + 1;
        }
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }
}
