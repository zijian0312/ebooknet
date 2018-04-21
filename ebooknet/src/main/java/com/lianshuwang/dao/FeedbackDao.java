package com.lianshuwang.dao;

import com.lianshuwang.domin.Feedback;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FeedbackDao {

    public int addFeedback(Feedback feedback);

    public List<Feedback> queryAllNotRead();

    public int setOneRead(int id);

    public int setAllRead();
}
