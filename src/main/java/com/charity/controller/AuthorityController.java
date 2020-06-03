package com.charity.controller;

import com.charity.entity.Authority;
import com.charity.service.AuthorityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

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