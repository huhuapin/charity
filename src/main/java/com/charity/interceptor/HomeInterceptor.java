package com.charity.interceptor;

import com.charity.entity.Application;
import com.charity.entity.Donor;
import com.charity.entity.User;
import com.charity.service.ApplicationService;
import com.charity.util.Recommend;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public class HomeInterceptor implements HandlerInterceptor {
    @Resource
    ApplicationService applicationService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        //查询是否有session
        if (session.getAttribute("recommends") == null) {
            //如果没有session，则判断用户是否登录来进行推荐
            User user = (User)session.getAttribute("user");
            if (user == null || user.getRole() != 2) {      //如果用户未登录或者该用户不是捐赠者，则按紧急程度查询已通过审核的项目推荐给用户
                List<Map<String,Object>> recommends = applicationService.queryRunOrderByUrgent(new Application());
                session.setAttribute("recommends",recommends);
            }else {
                Donor donor = (Donor)session.getAttribute("object");
                Recommend recommend = new Recommend();
                List<Map<String, String>> recommends = recommend.recommend(donor.getId());
                session.setAttribute("recommends",recommends);
            }
        }
        return true;
    }
}
