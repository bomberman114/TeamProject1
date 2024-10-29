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


    private static final String USER_LOGIN_URI = "/Users/Login";
    private static final String USER_FORM_URI = "/Users/LoginForm";
    private static final String COMPANY_LOGIN_URI = "/Company/LoginForm";
    private static final String COMPANY_LOGIN_FORM_URI = "/Company/Login";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        

        // 로그인 페이지를 제외
        if (requestURI.equals(USER_LOGIN_URI)   || requestURI.equals(USER_FORM_URI) || 
        	requestURI.equals(COMPANY_LOGIN_URI)|| requestURI.equals(COMPANY_LOGIN_FORM_URI)) {
            return true;
        }
        
        HttpSession session = request.getSession();
        UserVo user 			= (UserVo) session.getAttribute("user");
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
        
       

        return true; // 로그인 되어 있으면 요청 허용
    }

}











