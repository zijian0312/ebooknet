package com.lianshuwang.service;

import com.lianshuwang.dao.*;
import com.lianshuwang.domin.*;
import com.lianshuwang.helper.UploadHelper;
import com.lianshuwang.helper.UserHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private AvatarDao avatarDao;
    @Autowired
    private ContributionDao contributionDao;
    @Autowired
    private FeedbackDao feedbackDao;
    @Autowired
    private UploadDao uploadDao;
    @Autowired
    private BookDao bookDao;

    public User queryById(long id) {
        User user;
        user = userDao.queryById(id);
        return user;
    }

    public UserHelper getLoginUser(String userCode, String userPassword) {
        User user = userDao.queryByLogin(userCode, userPassword);
        if (null != user) {
            Avatar avatar = avatarDao.queryById(user.getAvatarNum());
            Contribution contribution = contributionDao.queryByValue(user.getContribution());
            UserHelper userHelper = new UserHelper();
            userHelper.setId(user.getId());
            userHelper.setUserCode(user.getUserCode());
            userHelper.setUserName(user.getUserName());
            userHelper.setEmail(user.getEmail());
            userHelper.setAvatar(avatar);
            userHelper.setContributionValue(user.getContribution());
            userHelper.setContribution(contribution);
            userHelper.setCreationDate(user.getCreationDate());
            return userHelper;
        } else {
            return null;
        }
    }

    public int checkUserCode(String userCode) {
        int count = userDao.queryByUserCode(userCode);
        return count;
    }

    public void addUser(User user) {
        int avatarNum = new Random().nextInt(10) + 1;
        user.setAvatarNum(avatarNum);
        user.setContribution(0);
        Date date = new Date();
        user.setCreationDate(date);
        userDao.addUser(user);
    }

    public void updateUserContribution(int addValue,long userID) {
        userDao.updateUserContribution(addValue,userID);
    }

    public void updateUserInfo(User user) {
        userDao.updateUserInfo(user);
    }

    public int getAvatarId(String avatar_img) {
        int avatarId = avatarDao.queryByImgPath(avatar_img);
        return avatarId;
    }

    public void updateUserPassword(long id, String password ) {
        userDao.updateUserPassword(id, password);
    }

    public void addFeedback(long userId, String contact, String suggestion) {
        Feedback feedback = new Feedback();
        feedback.setLoginedUser(userId);
        feedback.setContact(contact);
        feedback.setSuggestion(suggestion);
        feedback.setPostTime(new Timestamp(new Date().getTime()));
        feedbackDao.addFeedback(feedback);
    }

    public List<UploadHelper> getUploadedBook(long userId) {
        List<UploadHelper> uploadHelperList = new ArrayList<UploadHelper>();
        List<Upload> uploadList;
        uploadList = uploadDao.queryByUserId(userId);
        for (int i=0; i<uploadList.size(); i++) {
            UploadHelper upload = new UploadHelper();
            upload.setId(i+1);
            Book book = bookDao.queryById(uploadList.get(i).getUploadedBook());
            upload.setBookTitle(book.getBook_title());
            upload.setBookAuthor(book.getBook_author());
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String uploadDate = dateFormat.format(uploadList.get(i).getUploadedDate());
            upload.setUploadedDate(uploadDate);
            upload.setDownloadTimes(book.getDownload_times());
            uploadHelperList.add(upload);
        }
        return uploadHelperList;
    }

}
