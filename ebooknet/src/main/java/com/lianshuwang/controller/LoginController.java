package com.lianshuwang.controller;

import com.lianshuwang.domin.User;
import com.lianshuwang.helper.UserHelper;
import com.lianshuwang.service.UserService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ZhangZijian on 2017/4/13.
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    private static final Log logger = LogFactory.getLog(LoginController.class);

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> index(@RequestBody User user, HttpSession session) {
        logger.info("you are logging in!");
        String userCode = user.getUserCode();
        String password = user.getUserPassword();
        UserHelper userHelper = userService.getLoginUser(userCode,password);
        Map<String, Object> resultMap = new HashMap<String, Object>();
        if (null != userHelper) {
            session.setAttribute("userHelper",userHelper);
            resultMap.put("isLogined", true);
            resultMap.put("user", userHelper);
        } else {
            resultMap.put("isLogined", false);
        }
        return resultMap;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        logger.info("you have logged out!");
        session.invalidate();
        return "redirect:/index";
    }

}
