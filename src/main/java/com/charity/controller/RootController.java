package com.charity.controller;
import com.charity.entity.Authority;
import com.charity.entity.AuthorityUser;
import com.charity.entity.Donate;
import com.charity.entity.User;
import com.charity.service.*;
import com.charity.util.JacksonUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
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

    @GetMapping("index")
    public String index(Model model) {
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
        System.out.println(authorityUser.toString());
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
    public String deleteAuthority(int id) {

        Authority authority = authorityService.queryById(id);
        authorityService.deleteById(id);
        userService.deleteById(authority.getUserId());
        return  "admin/root/manage_authority";

    }

    @GetMapping("priority")
    public String priority(Model model) {
        return "admin/root/priority";
    }
}
