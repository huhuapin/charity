package com.charity.controller;

import com.charity.dao.DonateDao;
import com.charity.entity.*;
import com.charity.service.*;
import com.charity.util.JacksonUtil;
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
 * (Donee)表控制层
 *
 * @author hhp
 * @since 2020-05-10 21:31:55
 */
@Controller
@RequestMapping("donee")
public class DoneeController {
    /**
     * 服务对象
     */
    @Resource
    private DoneeService doneeService;
    @Resource
    private DonateService donateService;
    @Resource
    private UserService userService;
    @Resource
    private ApplicationService applicationService;
    @Resource
    private DonateDao donateDao;
    @Resource
    private AuthorityService authorityService;
    @Resource
    private CategoryService categoryService;




    @GetMapping("index")
    public String index(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Donee donee = (Donee) request.getSession().getAttribute("object");

        Authority authority = authorityService.queryById(donee.getAuthorityId());
        User authorityUser = userService.queryById(authority.getUserId());


        session.setAttribute("authority",authority);
        session.setAttribute("authorityName",authorityUser.getName());

        Application application = new Application();
        application.setDoneeId(donee.getId());
        int num = applicationService.count(application);
        //查询受赠记录
        List<Map<String, Object>> donates = donateService.queryAllByDoneeId(donee.getId());
        double money = 0.0;
        for (Map<String, Object> donate:donates) {
            money += (Double) donate.get("money");
        }
        List<Map<String, Object>> moneyDay = donateDao.queryMoneyDayByDoneeId(donee.getId());
        model.addAttribute("num",num);
        model.addAttribute("money",money);
        model.addAttribute("moneyDay", JacksonUtil.toJson(moneyDay));
        return "admin/donee/index";
    }


    @GetMapping("info")
    public String info() {
        return "admin/donee/info";
    }
    @PostMapping("setInfo")
    public String setInfo(String name,Donee donee,HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)request.getSession().getAttribute("user");
        Donee donee1 = (Donee) request.getSession().getAttribute("object");
        user.setName(name);
        donee.setId(donee1.getId());
        donee.setUserId(donee1.getUserId());
        donee.setAuthorityId(donee1.getAuthorityId());
        userService.update(user);
        doneeService.update(donee);
        request.getSession().setAttribute("user",user);
        request.getSession().setAttribute("object",donee);
        return "redirect:/donee/info";
    }

    @GetMapping("setPassword")
    public String setPassword() {
        return "admin/donee/password";
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
            writer.println("<script>alert('修改成功');window.location.href='"+request.getContextPath()+"/donee/index'</script>");
        }else {
            writer.println("<script>alert('您的密码不正确！');window.location.href='"+request.getContextPath()+"/donee/setPassword'</script>");
        }
        return null;
    }

    @GetMapping("addApplication")
    public String addApplication(Model model,HttpServletRequest request) {
        List<Category> categories = categoryService.queryAll(new Category());
        model.addAttribute("categories",categories);
        return "admin/donee/add_application";
    }

    @PostMapping("addApplication")
    public String insertApplication(Application application,HttpServletRequest request){
        HttpSession session = request.getSession();
        Donee donee = (Donee) session.getAttribute("object");
        application.setAuthorityId(donee.getAuthorityId());
        application.setDonoorNum(0);
        application.setStatus(0);
        application.setReceive(0.0);
        application.setUrgent(0);
        application.setDoneeId(donee.getId());
        applicationService.insert(application);
        return "redirect:/donee/application";
    }

    @GetMapping("application")
    public String manageApplication(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Donee donee = (Donee)session.getAttribute("object");
        Application application = new Application();
        application.setDoneeId(donee.getId());
        List<Map<String,Object>> applications = applicationService.queryAll(application);
        model.addAttribute("applications",JacksonUtil.toJson(applications));
        return "admin/donee/application_history";
    }

    @GetMapping("editApplication")
    public String editApplication(Model model,HttpServletRequest request,Integer id) {

        List<Category> categories = categoryService.queryAll(new Category());
        Application application = applicationService.queryById(id);
        model.addAttribute("categories",categories);
        model.addAttribute("application",application);
        return "admin/donee/edit_application";
    }

    @PostMapping("editApplication")
    public String updateApplication(Application application,HttpServletRequest request){
        applicationService.update(application);
        return "redirect:/donee/application";
    }

    @GetMapping("deleteApplication")
    public String deleteApplication(int id,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Donee donee = (Donee) session.getAttribute("object");
        Application application = applicationService.queryById(id);
        if (application!=null && application.getDoneeId() == donee.getId()) {
            applicationService.deleteById(id);
        }
        return "redirect:/donee/application";
    }
    @GetMapping("donate")
    public String history(HttpServletRequest request,Model model) {
        HttpSession session = request.getSession();
        Donee donee = (Donee)session.getAttribute("object");
        List<Map<String,Object>> donates = donateDao.queryAllByDoneeId(donee.getId());
        model.addAttribute("donates",JacksonUtil.toJson(donates));
        return "admin/donee/donate_history";
    }
}