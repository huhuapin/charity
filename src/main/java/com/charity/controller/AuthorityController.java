package com.charity.controller;

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
    @Resource
    CategoryService categoryService;
    @Resource
    NewsService newsService;
    @Resource
    TraceService traceService;

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
    public String index(Model model, HttpServletRequest request) {
        Donee donee = new Donee();

        Authority authority = (Authority) request.getSession().getAttribute("object");

        int authorityId = authority.getId();

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
    public String addApplication(Model model,HttpServletRequest request) {
        Authority authority = (Authority) request.getSession().getAttribute("object");
        Donee donee = new Donee();
        donee.setAuthorityId(authority.getId());
        List<Map<String,Object>> donees = doneeService.queryAllInfo(donee);
        List<Category> categories = categoryService.queryAll(new Category());
        model.addAttribute("donees",donees);
        model.addAttribute("categories",categories);
        return "admin/authority/add_application";
    }

    @PostMapping("addApplication")
    public String insertApplication(Application application,HttpServletRequest request){
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        application.setAuthorityId(authority.getId());
        application.setDonoorNum(0);
        application.setStatus(0);
        application.setReceive(0.0);
        if (application.getDoneeId() == 0) {
            application.setDoneeId(null);
        }
        applicationService.insert(application);
        return "redirect:/authority/manageApplication";
    }

    @GetMapping("manageApplication")
    public String manageApplication(Model model,HttpServletRequest request) {

        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        int authorityId = authority.getId();
        Application application = new Application();
        application.setAuthorityId(authorityId);
        List<Map<String,Object>> applications = applicationService.queryAll(application);
        model.addAttribute("applications",JacksonUtil.toJson(applications));
        return "admin/authority/manage_application";
    }

    @GetMapping("editApplication")
    public String editApplication(Model model,HttpServletRequest request,Integer id) {
        Authority authority = (Authority) request.getSession().getAttribute("object");
        Donee donee = new Donee();
        donee.setAuthorityId(authority.getId());
        List<Map<String,Object>> donees = doneeService.queryAllInfo(donee);
        List<Category> categories = categoryService.queryAll(new Category());
        Application application = applicationService.queryById(id);
        model.addAttribute("donees",donees);
        model.addAttribute("categories",categories);
        model.addAttribute("application",application);
        return "admin/authority/edit_application";
    }

    @PostMapping("editApplication")
    public String updateApplication(Application application,HttpServletRequest request){
        if (application.getDoneeId() == 0) {
            application.setDoneeId(null);
        }
        applicationService.update(application);
        return "redirect:/authority/manageApplication";
    }


    @PostMapping("searchApplication")
    @ResponseBody
    public Map<String, Object> searchApplication(String keywords,Integer status, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            List<Map<String,Object>> data = this.applicationService.search(authority.getId(),keywords,status);
            map.put("code",0);
            map.put("data",data);
        }catch (Exception e) {
            e.printStackTrace();
            map.put("code",-1);
            map.put("data",null);
        }

        return map;
    }

    @GetMapping("approveApplication")
    public String approveApplication(int id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter writer = response.getWriter();
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        Application application = applicationService.queryById(id);
        //只能改变未审核事件的状态
        String msg;
        if (application.getAuthorityId() == authority.getId()&&application.getStatus()==0) {
            Date now = new Date();
            int flag1 = now.compareTo(application.getStart());
            if (flag1 == -1) {      //项目未开始
                application.setStatus(1);
                msg = "项目已设置为未开始";
            }else{
                int flag2 = now.compareTo(application.getEnd());
                if (flag2 <=0) {        //项目正在进行
                    application.setStatus(2);
                    msg = "项目已设置为正在进行";
                }else {     //项目已结束
                    application.setStatus(3);
                    msg = "项目已结束";
                }
            }
            applicationService.update(application);
            writer.println("<script>alert('"+msg+"');window.location.href='"+request.getContextPath()+"/authority/manageApplication'</script>");
            return null;
        }
        writer.println("<script>alert('您没有该权限！');window.location.href='"+request.getContextPath()+"/authority/manageApplication'</script>");
        return null;
    }

    @GetMapping("disapprove")
    public String disapprove(int id,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        Application application = applicationService.queryById(id);
        if (application.getAuthorityId() == authority.getId()) {
            application.setStatus(4);       //设置状态为未通过
            applicationService.update(application);
        }
        return "redirect:/authority/manageApplication";
    }

    @GetMapping("deleteApplication")
    public String deleteApplication(int id,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        Application application = applicationService.queryById(id);
        if (application.getAuthorityId() == authority.getId()) {
            applicationService.deleteById(id);
        }
        return "redirect:/authority/manageApplication";
    }


    @GetMapping("donate")
    public String donate(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");

        int todayPeople = donateService.todayPeople(authority.getId());
        //查询当日的捐赠
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH),
                0, 0, 0);
        Date startDate = calendar.getTime();
        Date endDate = new Date();
        Donate donate = new Donate();
        donate.setAuthorityId(authority.getId());
        double todayMoney = donateService.queryMoneyAll(donate,startDate,endDate);        //当日捐赠金额
        List<Map<String,Object>> donates = donateService.queryAll(donate);                //机构的捐赠记录
        model.addAttribute("todayPeople",todayPeople);
        model.addAttribute("todayMoney",todayMoney);
        model.addAttribute("donates",JacksonUtil.toJson(donates));
        return "admin/authority/donate";
    }

    @GetMapping("approveDonate")
    public String approveDonate(Integer id) {
        Donate donate = donateService.queryById(id);
        donate.setStatus(1);
        //获取捐赠项目，增加已募资金和捐赠人数，考虑情况看是否更改状态
        Application application = applicationService.queryById(donate.getApplicationId());
        application.setReceive(application.getReceive()+donate.getMoney());
        application.setDonoorNum(application.getDonoorNum()+1);
        if (application.getReceive() >= application.getTarget()) {
            //如果已募资金达到目标  则设置项目状态为已完成
            application.setStatus(3);
        }
        donateService.update(donate);
        applicationService.update(application);
        return "redirect:/authority/donate";
    }

    @GetMapping("deleteDonate")
    public String deleteDonate(Integer id) {
        donateService.deleteById(id);
        return "redirect:/authority/donate";
    }

    @GetMapping("news")
    public String news(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        News news = new News();
        news.setAuthorityId(authority.getId());
        List<News> newsList = newsService.queryAll(news);
        model.addAttribute("newsList",JacksonUtil.toJson(newsList));
        return "admin/authority/manage_news";
    }
    @GetMapping("addNews")
    public String addNews() {
        return "admin/authority/add_news";
    }

    @PostMapping("addNews")
    public String insertNews(News news,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        news.setTime(new Date());
        news.setAuthorityId(authority.getId());
        news.setClick(0);
        newsService.insert(news);
        return "redirect:/authority/news";
    }

    @GetMapping("editNews")
    public String editNews(Integer id,Model model) {
        News news = newsService.queryById(id);
        model.addAttribute("news",news);
        return "admin/authority/edit_news";
    }

    @PostMapping("editNews")
    public String updateNews(News news,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        News news1 = newsService.queryById(news.getId());
        //证明新闻所有者
        if (news1.getAuthorityId() == authority.getId()){
            newsService.update(news);
        }
        return "redirect:/authority/news";
    }

    @PostMapping("searchNews")
    @ResponseBody
    public Map<String,Object> searchNews(String keywords,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        News news = new News();
        news.setAuthorityId(authority.getId());
        Map<String,Object> map = new HashMap<>();
        try {
            List<News> newsList = newsService.search(keywords,news);
            map.put("code",0);
            map.put("data",newsList);
        }catch (Exception e) {
            e.printStackTrace();
            map.put("code",-1);
            map.put("data",null);
        }

        return map;
    }

    @GetMapping("deleteNews")
    public String deleteNews(Integer id,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Authority authority = (Authority) session.getAttribute("object");
        News news = newsService.queryById(id);
        if (news.getAuthorityId() == authority.getId()){
            newsService.deleteById(id);
        }
        return "redirect:/authority/news";
    }


    //项目详情及物资流向
    @GetMapping("applicationDetail")
    public String applicationDetail(Model model,Integer id) {
        Application application = applicationService.queryById(id);
        System.out.println(application.toString());
        Trace trace = new Trace();
        trace.setApplymentId(application.getId());
        List<Trace> traces = traceService.queryAll(trace);
        model.addAttribute("application",application);
        model.addAttribute("traces",traces);
        return "admin/authority/application_detail";
    }

    @PostMapping("addTrace")
    @ResponseBody
    public Map<String,Object> addTrace(Trace trace) {
        Date date = new Date();
        trace.setTime(date);
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            traceService.insert(trace);
            map.put("code",0);
            map.put("data",trace);
        }catch (Exception e) {
            e.printStackTrace();
            map.put("code",-1);
            map.put("data",null);
        }
        return map;
    }

    @PostMapping("editTrace")
    @ResponseBody
    public Map<String,Object> editTrace(Trace trace) {
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            traceService.update(trace);
            map.put("code",0);
            map.put("data",null);
        }catch (Exception e) {
            e.printStackTrace();
            map.put("code",-1);
            map.put("data",null);
        }
        return map;
    }
    @GetMapping("deleteTrace")
    public String deleteTrace(Integer id) {
        try {
            Trace trace = traceService.queryById(id);
            traceService.deleteById(id);
            return "redirect:/authority/applicationDetail?id="+trace.getId();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}