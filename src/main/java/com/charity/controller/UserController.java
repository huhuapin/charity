package com.charity.controller;

import com.charity.entity.Authority;
import com.charity.entity.Donee;
import com.charity.entity.Donor;
import com.charity.entity.User;
import com.charity.service.AuthorityService;
import com.charity.service.DoneeService;
import com.charity.service.DonorService;
import com.charity.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

    @Resource
    AuthorityService authorityService;

    @Resource
    DonorService donorService;

    @Resource
    DoneeService doneeService;

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
        System.out.println("表现层出问题了？");
        Map<String ,Integer> map = new HashMap<String, Integer>();
        map.put("data",123);
        model.addAllAttributes(map);
        return "register";
    }

    @GetMapping("login")
    public String login() {
        return "register";
    }

    @PostMapping("login")
    public String doLogin(User user,String captcha,HttpServletResponse response,HttpServletRequest request,Model model) throws IOException {
        List<User> userList = userService.queryAll(user);
        if (userList.size()!=1) {
            PrintWriter writer = response.getWriter();
            writer.println("<script>alter('出现了点问题，请重试')</script>");
        }else {
            //获取用户
            user = userList.get(0);
            user.setLastLogin(new Date());
            //更新登录时间
            userService.update(user);
            //存入session
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            if (user.getRole() == 0) {                  //如果登录的是超级管理员
                return "redirect:/root/index";
            }else if (user.getRole() == 1){ //如果登录的是慈善机构
                //通过userId查询机构
                Authority authority = authorityService.queryById(user.getId());
                session.setAttribute("object",authority);
                return "redirect:/root/index";
            }else if (user.getRole() ==2) {     //登录的是捐赠者
                Donor donor = donorService.queryById(user.getId());
                session.setAttribute("object",donor);
                return "redirect:index";
            }else if (user.getRole() == 3) {        //登录的是受赠者
                Donee donee = doneeService.queryById(user.getId());
                session.setAttribute("object",donee);
                return  "redirect:index";
            }
        }
        return "admin/root/index";
    }

    @GetMapping("register")
    public String register(Model model) {
        List<Map<String,Object>> authorities = authorityService.queryAll(new Authority());
        model.addAttribute("authorities",authorities);
        return "register";
    }

    @PostMapping("register")
    public String doRegister(User user, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        if (user.getRole() !=3 &&user.getRole()!=2) {
            System.out.println("无效");
        }else if (user.getRole() == 2){
            //捐赠者
            try {
                user = userService.insert(user);
                Donor donor = new Donor();
                donor.setUserId(user.getId());
                donor.setSex(Integer.parseInt(request.getParameter("sex")));
                donor.setTel(request.getParameter("tel"));
                System.out.println(user.toString());
                System.out.println(donor.toString());
            }catch (Exception e) {
                e.printStackTrace();
                PrintWriter writer = response.getWriter();
                writer.println("<script>alter('出现了点问题，请重试')</script>");
            }
        }
        return "redirect:user/login";
    }
}