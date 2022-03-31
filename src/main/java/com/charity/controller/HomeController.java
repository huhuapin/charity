package com.charity.controller;

import com.charity.dao.ApplicationDao;
import com.charity.entity.*;
import com.charity.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {


    @Resource
    private ApplicationService applicationService;
    @Resource
    private ApplicationDao applicationDao;
    @Resource
    private CategoryService categoryService;
    @Resource
    private AuthorityService authorityService;
    @Resource
    private UserService userService;
    @Resource
    private TraceService traceService;
    @Resource
    private NewsService newsService;
    @Resource
    private DonateService donateService;


    @GetMapping("index")
    public String index(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();

        List<Category> categories = categoryService.queryAll(new Category());
        for (int i = 0; i < 4; i++) {
            if (categories.size()<=i) {
                model.addAttribute("category"+i,null);
                model.addAttribute("application"+i,null);
            }else {
                model.addAttribute("category"+i,categories.get(i));
                Application application = new Application();
                application.setCategoryId(categories.get(i).getId());
                model.addAttribute("application"+i,applicationService.queryRun(application,2));
            }
        }
        return "user/index";
    }

    @GetMapping("authority_list")
    public String authority(Model model) {

        List<Map<String, Object>> authorities = authorityService.queryAll(new Authority());
        model.addAttribute("authorities",authorities);
        return "user/authority_list";
    }

    @GetMapping("authority_detail")
    public String authorityDetail(Integer id,Model model)
    {
        Authority authority = new Authority();
        authority.setId(id);
        List<Map<String,Object>> authoritys = authorityService.queryAll(authority);
        if (authoritys.size()>0) {
            model.addAttribute("authority",authoritys.get(0));
            return "user/authority_detail";
        }
        return null;
    }

    @GetMapping("application_list")
    public String application(Integer categoryId,String keywords,Model model){
        List<Category> categories = categoryService.queryAll(new Category());
        Application application = new Application();
        application.setCategoryId(categoryId);
        List<Map<String, Object>> applications = applicationService.queryApplicationList(application,keywords);
        model.addAttribute("categories",categories);
        model.addAttribute("applications",applications);
        return "user/application_list";
    }

    @GetMapping("application_detail")
    public String applicationDetail(Integer id,Model model){
        Application application = applicationDao.queryById(id);
        Authority authority = authorityService.queryById(application.getAuthorityId());
        User authorityUser = userService.queryById(authority.getUserId());
        model.addAttribute("application",application);
        model.addAttribute("authorityName",authorityUser.getName());
        Trace trace = new Trace();
        trace.setApplymentId(id);
        List<Trace> traces = traceService.queryAll(trace);
        model.addAttribute("traces",traces);
        return "user/application_detail";
    }

    @GetMapping("article")
    public String article(Model model){

        List<News> newsList = newsService.queryAll(new News());
        Authority authority = new Authority();
        for (News news: newsList) {
            authority.setId(news.getAuthorityId());
            System.out.println(authority.getId());
            news.setAuthorityName((String) authorityService.queryAll(authority).get(0).get("name"));
        }
        model.addAttribute("articles",newsList);
        return "user/article_list";
    }

    @GetMapping("article_detail")
    public String articleDetail(Integer id,Model model){

        News news = newsService.queryById(id);
        Authority authority = new Authority();
        authority.setId(news.getAuthorityId());
        news.setAuthorityName((String) authorityService.queryAll(authority).get(0).get("name"));
        model.addAttribute("article",news);
        return "user/article_detail";
    }

    @GetMapping("donate")
    public String donate(Integer id,HttpServletRequest request,Model model) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if (user == null || user.getRole() != 2) {
            return "redirect:/user/login";
        }
        Application application = applicationDao.queryById(id);
        model.addAttribute("application",application);
        return "user/donate";
    }

    @PostMapping("donate")
    public String donate(Donate donate, HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        if (user == null || user.getRole() != 2) {
            return "redirect:/user/login";
        }
        try {
            Donor donor = (Donor)session.getAttribute("object");
            Application application = applicationDao.queryById(donate.getApplicationId());
            donate.setDonorId(donor.getId());
            donate.setDate(new Date());
            donate.setStatus(0);
            donate.setAuthorityId(application.getAuthorityId());
            System.out.println(donate);
            writer.println("<script>alert('捐赠成功，感谢您的帮助！');window.location.href='"+request.getContextPath()+"/application_detail?id="+ donate.getApplicationId() +"'</script>");
            donateService.insert(donate);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

}
