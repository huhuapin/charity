package com.charity.controller;

import com.charity.entity.User;
import com.charity.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * (User)表控制层
 *
 * @author makejava
 * @since 2020-05-10 18:48:20
 */
@Controller
@RequestMapping("user")
public class UserController {
    /**
     * 服务对象
     */
    @Resource
    UserService userService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    @ResponseBody
    public User selectOne(Integer id) {
        return this.userService.queryById(id);
    }

    @GetMapping("test")
    public String user(Integer id, HttpServletRequest request, HttpServletResponse response, Model model) {
        System.out.println("表现层");
        Map<String ,Integer> map = new HashMap<String, Integer>();
        map.put("data",123);
        model.addAllAttributes(map);
        return "index";
    }
}