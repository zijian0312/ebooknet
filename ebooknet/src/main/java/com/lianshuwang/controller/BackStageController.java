package com.lianshuwang.controller;

import com.lianshuwang.domin.Feedback;
import com.lianshuwang.domin.User;
import com.lianshuwang.helper.doBookHelper;
import com.lianshuwang.service.BackStageService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/backstage")
public class BackStageController {
    private static final Log logger = LogFactory.getLog(BackStageController.class);
    @Autowired
    private BackStageService backStageService;

    @RequestMapping(value = "/")
    public String getLogin() {
        return "backstage/adminLogin";
    }

    @RequestMapping(value = "/backlogin")
    public String login(String username, String password, Model model, HttpSession session) {
        boolean isLogin = backStageService.getLogin(username, password);
        if (isLogin) {
            session.setAttribute("status",true);
            return "redirect:bookManage";
        } else {
            model.addAttribute("error","登陆失败，请重试！");
            return "backstage/adminLogin";
        }
    }

    @RequestMapping(value = "/bookManage")
    public String bookManage(Model model,HttpSession session) {
        if (null == session.getAttribute("status")) {
            return "backstage/adminLogin";
        }
        List<doBookHelper> bookList;
        bookList = backStageService.getUploadBooks();
        model.addAttribute("bookList",bookList);
        return "backstage/bookManage";
    }
    @RequestMapping(value = "/searchBookByDays")
    public String searchBookByDays(int days, Model model,HttpSession session) {
        if (null == session.getAttribute("status")) {
            return "backstage/adminLogin";
        }
        List<doBookHelper> bookList;
        bookList = backStageService.getBooksByDays(days);
        model.addAttribute("bookList",bookList);
        return "backstage/bookManage";
    }
    @RequestMapping(value = "/searchBookByTitle")
    public String searchBookByTitle(String title, Model model,HttpSession session) {
        if (null == session.getAttribute("status")) {
            return "backstage/adminLogin";
        }
        List<doBookHelper> bookList;
        bookList = backStageService.getBooksByTitle(title);
        model.addAttribute("bookList",bookList);
        return "backstage/bookManage";
    }
    @RequestMapping(value = "/searchBookByUser")
    public String searchBookByUser(long userId, Model model,HttpSession session) {
        if (null == session.getAttribute("status")) {
            return "backstage/adminLogin";
        }
        List<doBookHelper> bookList;
        bookList = backStageService.getBooksByUserId(userId);
        model.addAttribute("bookList",bookList);
        return "backstage/bookManage";
    }
    @RequestMapping(value = "/deleteBook")
    @ResponseBody
    public Map<String,Object> deleteBook(long bookId) {
        logger.info("you are removing a book!");
        Map<String,Object> resultMap = new HashMap<String,Object>();
        int result = backStageService.deleteBook(bookId);
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/userManage")
    public String userManage(Model model,HttpSession session) {
        if (null == session.getAttribute("status")) {
            return "backstage/adminLogin";
        }
        Map<String,Object> resultMap;
        resultMap = backStageService.getUserByContribution();
        List<User> userList = (List<User>) resultMap.get("userList");
        int totalUser = (Integer) resultMap.get("totalUser");
        int weekUser = (Integer) resultMap.get("weekUser");
        int monthUser = (Integer) resultMap.get("monthUser");
        model.addAttribute("userList",userList);
        model.addAttribute("weekUser",weekUser);
        model.addAttribute("monthUser",monthUser);
        model.addAttribute("totalUser",totalUser);
        return "backstage/userManage";
    }

    @RequestMapping(value = "/deleteUser")
    @ResponseBody
    public Map<String,Integer> deleteUser(long userId) {
        logger.info("you are removing a user!");
        Map<String,Integer> resultMap = new HashMap<String,Integer>();
        int result = backStageService.deleteUser(userId);
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/searchUser")
    public String searchUser(String user, Model model,HttpSession session) {
        if (null == session.getAttribute("status")) {
            return "backstage/adminLogin";
        }
        List<User> userList = backStageService.getUserBySearch(user);
        Map<String,Object> resultMap;
        resultMap = backStageService.getUserByContribution();
        int totalUser = (Integer) resultMap.get("totalUser");
        int weekUser = (Integer) resultMap.get("weekUser");
        int monthUser = (Integer) resultMap.get("monthUser");
        model.addAttribute("userList",userList);
        model.addAttribute("weekUser",weekUser);
        model.addAttribute("monthUser",monthUser);
        model.addAttribute("totalUser",totalUser);
        return "backstage/userManage";
    }

    @RequestMapping(value = "/feedbackManage")
    public String feedbackManage(Model model,HttpSession session) {
        if (null == session.getAttribute("status")) {
            return "backstage/adminLogin";
        }
        List<Feedback> feedbackList = backStageService.getFeedback();
        model.addAttribute("feedbackNum",feedbackList.size());
        model.addAttribute("feedbackList",feedbackList);
        return "backstage/feedbackManage";
    }

    @RequestMapping(value = "/setRead")
    @ResponseBody
    public void setFeedbackRead(int feedbackId) {
        backStageService.setOneFeedbackRead(feedbackId);
    }

    @RequestMapping(value = "/setAllRead")
    public String setAllFeedbackRead() {
        backStageService.setAllFeedbackRead();
        return "redirect:feedbackManage";
    }


}
