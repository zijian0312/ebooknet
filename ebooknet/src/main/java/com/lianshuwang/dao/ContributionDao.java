package com.lianshuwang.dao;

import com.lianshuwang.domin.Contribution;
import org.springframework.stereotype.Repository;

/**
 * Created by ZhangZijian on 2017/4/13.
 */
@Repository
public interface ContributionDao {

    public Contribution queryByValue(int value);
}
