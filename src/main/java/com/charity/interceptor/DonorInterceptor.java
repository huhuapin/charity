package com.charity.interceptor;

import com.charity.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DonorInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
        //在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //返回false则不执行拦截
        if (user == null || user.getRole() != 2) {
            //登录失败，跳转到登录页
            response.sendRedirect(request.getContextPath() + "/user/login");
            return false;
        } else {
            //登陆成功，不拦截
            return true;
        }
    }
}

