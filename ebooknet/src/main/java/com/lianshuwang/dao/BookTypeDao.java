package com.lianshuwang.dao;

import com.lianshuwang.domin.BookType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhangZijian on 2017/4/13.
 */
@Repository
public interface BookTypeDao {

    /**
     * 通过id查询图书类型
     * @param id
     * @return
     */
    public BookType queryById(int id);

    /**
     * 通过主分类下的图书类型
     * @param largeTypeName
     * @return
     */
    public List<BookType> queryByLargeTypeName(String largeTypeName);
}
