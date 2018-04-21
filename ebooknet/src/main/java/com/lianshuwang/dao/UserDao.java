package com.lianshuwang.dao;

import com.lianshuwang.domin.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhangZijian on 2017/4/12.
 */
@Repository
public interface UserDao {

    /**
     * 通过id查找用户
     * @param id
     * @return
     */
    public User queryById(long id);

    /**
     * 通过用户名和密码查询用户信息
     * @param userCode
     * @param userPassword
     * @return
     */
    public User queryByLogin(@Param("userCode") String userCode,
                             @Param("userPassword") String userPassword);

    /**
     * 查询用户名是否存在
     * @param userCode
     * @return
     */
    public int queryByUserCode(String userCode);

    /**
     * 添加用户
     * @param user
     * @return
     */
    public int addUser(User user);

    public int updateUserPassword(@Param("id") long id,
                                  @Param("userPassword") String userPassword);

    public int updateUserContribution(@Param("addValue") int addValue,
                                      @Param("id") long id);

    public int updateUserInfo(User user);

    public List<User> queryUserByContribution();

    public int queryUserNumber();

    public int queryUserNumberByWeek();

    public int queryUserNumberByMonth();

    public int deleteUser(long id);

    public List<User> queryUserByUserName(String userName);

}
