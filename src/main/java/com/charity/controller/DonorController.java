package com.charity.controller;

import com.charity.dao.DonateDao;
import com.charity.dao.UserDao;
import com.charity.entity.Authority;
import com.charity.entity.Donate;
import com.charity.entity.Donor;
import com.charity.entity.User;
import com.charity.service.DonateService;
import com.charity.service.DonorService;
import com.charity.service.UserService;
import com.charity.util.JacksonUtil;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * (Donor)表控制层
 *
 * @author hhp
 * @since 2020-05-11 18:33:47
 */
@Controller
@RequestMapping("donor")
public class DonorController {
    /**
     * 服务对象
     */
    @Resource
    private DonorService donorService;
    @Resource
    private UserService userService;
    @Resource
    private DonateService donateService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Donor selectOne(Integer id) {
        return this.donorService.queryById(id);
    }
    @GetMapping("index")

    public String index(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();

        Donor donor = (Donor) session.getAttribute("object");

        Donate donate = new Donate();
        donate.setDonorId(donor.getId());
        int times = donateService.queryTimesAll(donate);
        double money = donateService.queryMoneyAll(donate,null,null);
        List<Map<String,Object>> moneyDay = donateService.queryMoneyDay(donate);
        model.addAttribute("times",times);
        model.addAttribute("money",money);
        model.addAttribute("moneyDay", JacksonUtil.toJson(moneyDay));
        return "admin/donor/index";

    }

    @GetMapping("info")
    public String info() {
        return "admin/donor/info";
    }
    @PostMapping("setInfo")
    public String setInfo(String name,Donor donor,HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)request.getSession().getAttribute("user");
        Donor donor1 = (Donor) request.getSession().getAttribute("object");
        user.setName(name);
        donor.setId(donor1.getId());
        donor.setUserId(donor1.getUserId());
        userService.update(user);
        donorService.update(donor);
        request.getSession().setAttribute("user",user);
        request.getSession().setAttribute("object",donor);
        return "redirect:/donor/info";
    }

    @GetMapping("setPassword")
    public String setPassword() {
        return "admin/donor/password";
    }

    @PostMapping("setPassword")
    public String updatePassword(String oldPassword, String password, HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        System.out.println(oldPassword);
        User user = (User)session.getAttribute("user");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        if (oldPassword.equals(user.getPassword())) {
            user.setPassword(password);
            userService.update(user);
            session.setAttribute("user",user);
            writer.println("<script>alert('修改成功');window.location.href='"+request.getContextPath()+"/donor/index'</script>");
        }else {
            writer.println("<script>alert('您的密码不正确！');window.location.href='"+request.getContextPath()+"/donor/setPassword'</script>");
        }
        return null;
    }

    @GetMapping("history")
    public String history(HttpServletRequest request,Model model) {
        HttpSession session = request.getSession();
        User user = (User)request.getSession().getAttribute("user");
        Donor donor = (Donor) request.getSession().getAttribute("object");
        Donate donate = new Donate();
        donate.setDonorId(donor.getId());
        List<Map<String,Object>> donates = donateService.queryAll(donate);
        model.addAttribute("donates",JacksonUtil.toJson(donates));
        return "admin/donor/donate_history";
    }

    @GetMapping("deleteDonate")
    public String deleteDonate(Integer id,HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User)request.getSession().getAttribute("user");
        Donor donor = (Donor) request.getSession().getAttribute("object");
        Donate donate = donateService.queryById(id);
        if (donate!=null&&donate.getDonorId() == donor.getId()) {
            donateService.deleteById(id);
        }
        return "redirect:/donor/history";
    }
}