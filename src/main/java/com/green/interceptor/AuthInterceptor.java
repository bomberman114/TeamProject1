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
        System.out.println(requestURI);
        if (requestURI.equals("/Users/Login") || requestURI.equals("/Users/LoginForm") ||
            requestURI.equals("/Company/Login") || requestURI.equals("/Company/LoginForm") ||
            requestURI.equals("/Company/Logout") || requestURI.equals("/Users/Logout") ||
            requestURI.equals("/Company/RegisterForm")|| requestURI.equals("/Company/Register") || 
            requestURI.equals("/Users/RegisterForm") || requestURI.equals("/Users/Register") ||
            requestURI.equals("/Resume/ResgiterResumeForm") || requestURI.equals("/Resume/RegisterResume")
            || requestURI.equals("/Resume/ViewResume")

            ) {
            return true;
        }

        HttpSession session = request.getSession();
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











