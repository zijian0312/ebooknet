package com.lianshuwang.controller;

import com.lianshuwang.domin.User;
import com.lianshuwang.service.UserService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by ZhangZijian on 2017/4/16.
 */
@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    private static final Log logger = LogFactory.getLog(RegisterController.class);

    @RequestMapping(value = "userCodeCheck")
    @ResponseBody
    public Map<String,Integer> checkUserCode(String userCode) {
        Map<String, Integer> resultMap = new HashMap<String, Integer>();
        int count = userService.checkUserCode(userCode);
        resultMap.put("isRegistered", count);
        return resultMap;
    }

    @RequestMapping(value = "register",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> register(@RequestBody User user) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        userService.addUser(user);
        logger.info("you have registered!");
        return resultMap;
    }
}
