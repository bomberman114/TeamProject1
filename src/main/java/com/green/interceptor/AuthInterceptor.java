package com.green.interceptor;


import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;


import com.green.users.vo.UserVo;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Component
public class AuthInterceptor implements HandlerInterceptor {


    private static final String LOGIN_URI = "/Users/Login";
    private static final String LOGIN_FORM_URI = "/Users/LoginForm";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        

        // 로그인 페이지를 제외
        if (requestURI.equals(LOGIN_URI) || requestURI.equals(LOGIN_FORM_URI)) {
            return true;
        }

        HttpSession session = request.getSession();
        UserVo login = (UserVo) session.getAttribute("login");

        if (login == null) {
            // 로그인되어 있지 않다, 로그인 페이지로 이동
            String fmt = "/Users/LoginForm?uri=%s";
            String loc = String.format(fmt, requestURI);
            response.sendRedirect(loc);
            return false;
        }

        return true; // 로그인 되어 있으면 요청 허용
    }

}











