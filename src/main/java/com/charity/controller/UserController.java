package com.charity.controller;

import com.charity.entity.Authority;
import com.charity.entity.Donee;
import com.charity.entity.Donor;
import com.charity.entity.User;
import com.charity.service.AuthorityService;
import com.charity.service.DoneeService;
import com.charity.service.DonorService;
import com.charity.service.UserService;
import com.charity.util.VerifyCode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
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

    @Resource
    VerifyCode verifyCode;

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
        Map<String ,Integer> map = new HashMap<String, Integer>();
        map.put("data",123);
        model.addAllAttributes(map);
        return "login";
    }

    @GetMapping("login")
    public String login() {
        return "login";
    }

    @PostMapping("login")
    public String doLogin(User user,String captcha,HttpServletResponse response,HttpServletRequest request,Model model) throws IOException {
        HttpSession session = request.getSession();
        String verifyCode = (String) session.getAttribute("VerifyCode");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        if (verifyCode==null||verifyCode.equalsIgnoreCase(captcha) == false) {
            writer.println("<script>alert('验证码错误，请重试');window.location.href='"+request.getContextPath()+"/user/login'</script>");
            return null;
        }
        List<User> userList = userService.queryAll(user);
        if (userList.size()!=1) {
            writer.println("<script>alert('用户名密码错误，请重试');window.location.href='"+request.getContextPath()+"/user/login'</script>");
            return null;
        }else {
            //获取用户
            user = userList.get(0);
            session.setAttribute("user",user);
            user.setLastLogin(new Date());
            //更新登录时间
            userService.update(user);
            //判断用户角色进入不同页面
            if (user.getRole() == 0) {                  //如果登录的是超级管理员
                session.setAttribute("object",null);
                return "redirect:/root/index";
            }else if (user.getRole() == 1){ //如果登录的是慈善机构
                //通过userId查询机构
                Authority authority = authorityService.queryByUserId(user.getId());
                session.setAttribute("object",authority);
                return "redirect:/authority/index";
            }else if (user.getRole() ==2) {     //登录的是捐赠者
                Donor donor = donorService.queryByUserId(user.getId());
                session.setAttribute("object",donor);
                session.removeAttribute("recommends");
                return "redirect:/index";
            }else if (user.getRole() == 3) {        //登录的是受赠者
                Donee donee = doneeService.queryByUserId(user.getId());
                session.setAttribute("object",donee);
                return  "redirect:/donee/index";
            }else {
                writer.println("<script>alert('用户名密码错误，window.location.href='"+request.getContextPath()+"/user/login'</script>");
                return null;
            }
        }
    }

    @GetMapping("register")
    public String register(Model model) {
        List<Map<String,Object>> authorities = authorityService.queryAll(new Authority());
        model.addAttribute("authorities",authorities);
        return "register";
    }

    @PostMapping("register")
    public String doRegister(User user, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();

        //查询用户名
        User selectUser = new User();
        selectUser.setUsername(user.getUsername());
        if (userService.queryAll(selectUser).size() >0) {
            writer.println("<script>alert('用户名已存在');history.go(-1)</script>");
            return null;
        }

        user.setLastLogin(new Date());
        user.setCreateTime(new Date());
        if (user.getRole() !=3 &&user.getRole()!=2) {
            writer.println("<script>alert('您的操作有误请重试');history.go(-1)</script>");
        }else if (user.getRole() == 2){
            //捐赠者
            try {
                user = userService.insert(user);
                Donor donor = new Donor();
                donor.setUserId(user.getId());
                donor.setSex(Integer.parseInt(request.getParameter("sex")));
                donor.setTel(request.getParameter("tel"));
                donorService.insert(donor);
                writer.println("<script>alert('注册成功！');window.location.href='"+request.getContextPath()+"/user/login'</script>");
            }catch (Exception e) {
                e.printStackTrace();
                writer.println("<script>alert('您的操作有误请重试');history.go(-1)</script>");
            }
        }else if (user.getRole() == 3) {
            try {
                user = userService.insert(user);
                Donee donee = new Donee();
                donee.setUserId(user.getId());
                donee.setAuthorityId(Integer.parseInt(request.getParameter("authorityId")));
                donee.setSex(Integer.parseInt(request.getParameter("sex")));
                donee.setTel(request.getParameter("tel"));
                doneeService.insert(donee);
                writer.println("<script>alert('注册成功！');window.location.href='"+request.getContextPath()+"/user/login'</script>");
            }catch (Exception e) {
                e.printStackTrace();
                writer.println("<script>alert('您的操作有误请重试');history.go(-1)</script>");
            }
        }
        return null;
    }

    @GetMapping("logout")
    public String logout(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.removeAttribute("object");
        return "redirect:/user/login";
    }

    @GetMapping("checkCode")
    public void checkCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        //response.setContentType(MIME)的作用是使客户端浏览器，区分不同种类的数据，并根据不同的MIME调用浏览器内不同的程序嵌入模块来处理相应的数据。
        ImageIO.write(verifyCode.getImage(), "jpg", response.getOutputStream());
        HttpSession session = request.getSession(false);
        session.setAttribute("VerifyCode",verifyCode.getText());
    }

    @GetMapping("my")
    public String my(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }else if (user.getRole() == 0) {
            return "redirect:/root/index";
        }else if (user.getRole() ==1 ){
            return "redirect:/authority/index";
        }else if (user.getRole() == 2) {
            return "redirect:/donor/index";
        }else if (user.getRole() == 3) {
            return "redirect:/donee/index";
        }else {
            return "redirect:/user/login";
        }
    }

}