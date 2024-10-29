package com.green.interceptor;


import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.green.company.users.vo.CompanyUserVo;
import com.green.users.vo.UserVo;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        // 로그인 페이지 제외 설정
        if (requestURI.equals("/Users/Login") || requestURI.equals("/Users/LoginForm") ||
            requestURI.equals("/Company/Login") || requestURI.equals("/Company/LoginForm")) {

            return true;
        }
        
        HttpSession session = request.getSession();

        UserVo user          = (UserVo) session.getAttribute("user");
        CompanyUserVo companyUser = (CompanyUserVo) session.getAttribute("companyUser");
        System.out.println("인터셉터:"+user);
        System.out.println("인터셉터:"+companyUser);
        if (user == null ) {
            // 로그인되어 있지 않다, 로그인 페이지로 이동
            String fmt = "/Users/LoginForm?uri=%s";
            String loc = String.format(fmt, requestURI);
            response.sendRedirect(loc);
            return false;
        };
        
        if ( companyUser == null) {
           // 로그인되어 있지 않다, 로그인 페이지로 이동
           String fmt = "/Company/LoginForm?uri=%s";
           String loc = String.format(fmt, requestURI);
           response.sendRedirect(loc);
           return false;
        };
        
       

        UserVo userLogin = (UserVo) session.getAttribute("userLogin");
        CompanyUserVo companyUserLogin = (CompanyUserVo) session.getAttribute("companyUserLogin");

        // 로그인 세션이 없을 때 로그인 페이지로 리다이렉트
        if (userLogin == null && companyUserLogin == null) {
            String loc = String.format("/Users/LoginForm?uri=%s", requestURI);
            response.sendRedirect(loc);
            return false;
        }
        return true;


    }

}











