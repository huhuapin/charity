package com.charity.controller;

import com.charity.service.ApplicationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;

@Controller
public class HomeController {


    @Resource
    ApplicationService applicationService;


    @GetMapping("index")
    public String index(){
        System.out.println("这里是主页");
        return "user/index";
    }

    @GetMapping("authority_list")
    public String authority() {
        return "user/authority_list";
    }

    @GetMapping("authority_detail")
    public String authorityDetail() {
        return "user/authority_detail";
    }

    @GetMapping("application_list")
    public String application(){

        return "user/application_list";
    }

    @GetMapping("application_detail")
    public String applicationDetail(){

        return "user/application_detail";
    }

    @GetMapping("article")
    public String article(){

        return "user/article_list";
    }

    @GetMapping("article_detail")
    public String articleDetail(){

        return "user/article_detail";
    }

    @GetMapping("donate")
    public String donate() {
        return "user/donate";
    }

}
