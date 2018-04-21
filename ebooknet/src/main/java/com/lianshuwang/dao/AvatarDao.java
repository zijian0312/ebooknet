package com.lianshuwang.dao;

import com.lianshuwang.domin.Avatar;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhangZijian on 2017/4/12.
 */
@Repository
public interface AvatarDao {

    /**
     * 通过头像编号获取图像
     * @param id
     * @return
     */
    public Avatar queryById(int id);

    /**
     * 查询所有头像
     * @return
     */
    public List<Avatar> queryAll();

    public int queryByImgPath(String avatar_img);
}
