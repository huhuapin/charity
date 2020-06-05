package com.charity.controller;

import com.charity.entity.Application;
import com.charity.entity.Authority;
import com.charity.entity.Donate;
import com.charity.entity.Donee;
import com.charity.service.*;
import com.charity.util.JacksonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;

/**
 * (Authority)表控制层
 *
 * @author hhp
 * @since 2020-05-29 19:20:52
 */
@Controller
@RequestMapping("authority")
public class AuthorityController {
    /**
     * 服务对象
     */
    @Resource
    private AuthorityService authorityService;
    @Resource
    UserService userService;
    @Resource
    DonorService donorService;
    @Resource
    DonateService donateService;
    @Resource
    DoneeService doneeService;
    @Resource
    ApplicationService applicationService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Authority selectOne(Integer id, Model mode) {
        return this.authorityService.queryById(id);
    }

    @GetMapping("index")
    public String index(Model model) {
        Donee donee = new Donee();

        /**
         * 修改别忘了
         */
        //设置机构id  此处需修改
        int authorityId = 1;

        donee.setAuthorityId(authorityId);
        int doneeCount = doneeService.queryAll(donee).size();      //受赠者
        double totalFound = authorityService.queryById(authorityId).getFound();     //资金规模

        //查询当日的捐赠
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH),
                0, 0, 0);
        Date startDate = calendar.getTime();
        Date endDate = new Date();
        Donate donate = new Donate();
        donate.setAuthorityId(authorityId); //设置查询条件
        double todayMoney = donateService.queryMoneyAll(donate,startDate,endDate);        //当日捐赠金额

        //查询近七日捐赠额
        String s = null;
        List<Map<String,Object>> moneyDay = donateService.queryMoneyDay(donate);
        if (moneyDay==null) {
            System.out.println("moenyDay is NULL");
            s = JacksonUtil.toJson(new ArrayList<>());
        }else {
            s = JacksonUtil.toJson(moneyDay);
        }
        Application application = new Application();
        application.setAuthorityId(authorityId);
        int applicationCount = applicationService.count(application);
        Map<String ,Object> data = new HashMap<String, Object>();
        data.put("applicationCount",applicationCount);
        data.put("doneeCount",doneeCount);
        data.put("totalFound",totalFound);
        data.put("todayMoney",todayMoney);
        data.put("moneyDay",s);
        model.addAllAttributes(data);
        return "admin/authority/index";


    }

    @GetMapping("addApplication")
    public String addApplication(Model model) {
        return "admin/authority/add_application";
    }
    @GetMapping("manageApplication")
    public String manageApplication(Model model) {
        return "admin/authority/manage_application";
    }
    @GetMapping("donate")
    public String donate(Model model) {
        return "admin/authority/donate";
    }
    @GetMapping("news")
    public String news(Model model) {
        return "admin/authority/manage_news";
    }
    @GetMapping("application/detail")
    public String applocationDetail() {
        return "admin/authority/application_detail";
    }

}