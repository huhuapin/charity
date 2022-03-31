package com.charity.controller;
import com.charity.entity.*;
import com.charity.service.*;
import com.charity.util.JacksonUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@Controller
@RequestMapping("root")
public class RootController {
    @Resource
    UserService userService;
    @Resource
    AuthorityService authorityService;
    @Resource
    DonorService donorService;
    @Resource
    DonateService donateService;
    @Resource
    DoneeService doneeService;
    @Resource
    ApplicationService applicationService;

    @GetMapping("index")
    public String index(Model model, HttpServletRequest request) {

        int userCount = userService.count();        //用户数
        int authorityCount = authorityService.count();      //慈善机构数
        int donorCount = donorService.count();      //捐赠者
        int doneeCount = doneeService.count();      //受赠者
        double totalFound = authorityService.totalFound();     //资金规模
        //查询当日的捐赠
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH),
                0, 0, 0);
        Date startDate = calendar.getTime();
        Date endDate = new Date();
        Donate donate = new Donate();
        double todayMoney = donateService.queryMoneyAll(donate,startDate,endDate);        //当日捐赠金额
        //查询近七日捐赠额
        String s = null;
        List<Map<String,Object>> moneyDay = donateService.queryMoneyDay(donate);
        if (moneyDay==null) {
            System.out.println("moenyDay is NULL");
        }else {
            s = JacksonUtil.toJson(moneyDay);
        }

        Map<String ,Object> data = new HashMap<String, Object>();
        data.put("userCount",userCount);
        data.put("authorityCount",authorityCount);
        data.put("donorCount",donorCount);
        data.put("doneeCount",doneeCount);
        data.put("totalFound",totalFound);
        data.put("todayMoney",todayMoney);
        data.put("moneyDay",s);
        model.addAllAttributes(data);
        return "admin/root/index";
    }

    @GetMapping("addAuthority")
    public String addAuthority() {
        return  "admin/root/add_authority";
    }

    @PostMapping("addAuthority")
    public String add(AuthorityUser authorityUser,Model model) {

        User selectUser = new User();
        selectUser.setUsername(authorityUser.getUsername());
        if (userService.queryAll(selectUser).size()>0) {
            return "redirect:/root/manageAuthority";
        }
        User user = new User();
        BeanUtils.copyProperties(authorityUser,user);
        user.setLastLogin(new Date());
        user.setRole(1);
        user.setCreateTime(new Date());
        user = userService.insert(user);
        System.out.println(user.toString());


        Authority authority = new Authority();
        BeanUtils.copyProperties(authorityUser,authority);
        authority.setStatus(1);
        authority.setUserId(user.getId());
        authorityService.insert(authority);
        return "redirect:/root/manageAuthority";
    }

    @GetMapping("manageAuthority")
    public String manageAuthority(Model model)
    {
        Authority authority = new Authority();
        List<Map<String,Object>> authorities = authorityService.queryAll(authority);
        System.out.println(JacksonUtil.toJson(authorities));
        model.addAttribute("data",JacksonUtil.toJson(authorities));
        return  "admin/root/manage_authority";
    }

    @PostMapping("searchAuthority")
    @ResponseBody
    public Map<String, Object> searchAuthority(String name) {
        Map<String,Object> result = new HashMap<String, Object>();
        try {
            List<Map<String,Object>> authorities = authorityService.queryByName(name);
            result.put("code",0);
            result.put("data",authorities);
        }catch (Exception e) {
            e.printStackTrace();
            result.put("code",-1);
            result.put("data",new ArrayList<>());
        }
        return  result;
    }

    @GetMapping("deleteAuthority")
    public String deleteAuthority(int id, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        Authority authority = authorityService.queryById(id);
        if (authority !=null ) {
            authorityService.deleteById(id);
            userService.deleteById(id);
            writer.println("<script>alter('删除成功')</script>");
        }else {
            writer.println("<script>alter('机构不存在');history.go(-1)</script>");
        }
        return  "redirect:/root/manageAuthority";
    }

    @GetMapping("priority")
    public String priority(Model model) {
        Application application = new Application();
        application.setUrgent(1);
        List<Map<String,Object>> waitList = applicationService.queryAll(application);
        application.setUrgent(2);
        List<Map<String, Object>> finishList = applicationService.queryAll(application);
        model.addAttribute("waitList",JacksonUtil.toJson(waitList));
        model.addAttribute("finishList",JacksonUtil.toJson(finishList));
        return "admin/root/priority";
    }
    @GetMapping("setPriority")
    public String setPriority(Application application,Model model) {
        System.out.println(application.toString());
        try {
            applicationService.setPriority(application);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/root/priority";
    }

    @GetMapping("info")
    public String info() {
        return "admin/root/info";
    }

    @PostMapping("setInfo")
    public String setInfo(User user,String oldPassword,HttpServletRequest request,HttpServletResponse response) throws IOException {
        User loginUser = (User)request.getSession().getAttribute("user");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        if (loginUser.getPassword().equals(oldPassword)) {
            loginUser.setName(user.getName());
            loginUser.setPassword(user.getPassword());
            userService.update(loginUser);
            writer.println("<script>alert('修改成功');window.location.href='"+request.getContextPath()+"/root/info'</script>");
            return null;
        }
        writer.println("<script>alert('原密码错误，请重试！');history.go(-1)</script>");
        return null;
    }

    @GetMapping("editAuthority")
    public String editAuthority(int id,Model model) {
        Authority authority = new Authority();
        authority.setId(id);
        List<Map<String,Object>> authoritys = authorityService.queryAll(authority);
        if (authoritys.size()>0) {
            model.addAttribute("authority",authoritys.get(0));
            return "admin/root/edit_authority";
        }
        return null;
    }

    @PostMapping("updateAuthority")
    public String updateAuthority(AuthorityUser authorityUser,HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("uft8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        User user = new User();
        user.setName(authorityUser.getName());
        user.setId(authorityUser.getUserId());
        Authority authority = new Authority();
        BeanUtils.copyProperties(authorityUser,authority);
        authority.setUserId(null);
        try {
            userService.update(user);
            authorityService.update(authority);
        }catch (Exception e) {
            e.printStackTrace();
            writer.println("<script>alert('更新失败！');history.go(-1)</script>");
            return null;
        }
        return  "redirect:/root/manageAuthority";
    }
}
