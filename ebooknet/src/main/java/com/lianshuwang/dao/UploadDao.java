package com.lianshuwang.dao;

import com.lianshuwang.domin.Upload;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by ZhangZijian on 2017/4/13.
 */
@Repository
public interface UploadDao {

    public Upload queryById(int id);

    public int addUploadRecord(Upload upload);

    public Upload queryByBookId(long uploadedBook);

    public Date getMaxUploadDate();

    public List<Upload> queryByUploadedDate();

    public List<Upload> queryByUserId(long userId);

    public int deleteUploadRow(long uploadedBook);

    public int deleteUploadRowByUser(long uploader);

    public List<Upload> searchByToday();

    public List<Upload> searchBySevenDays();

    public List<Upload> searchByThirtyDays();

}
