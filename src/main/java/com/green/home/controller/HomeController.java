package com.green.home.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;
	
	   @GetMapping("/")
	   public ModelAndView home(HttpServletRequest request) {
	       ModelAndView mv = new ModelAndView();

	       // 회사 채용 리스트 가져오기
	       List<CompanyRecruitVo> companyRecruitList = companyRecruitMapper.companyRecruitList();
	       mv.addObject("companyRecruitList", companyRecruitList); // 리스트 추가

	       // 세션에서 로그인된 사용자 정보 가져오기
	       HttpSession session = request.getSession();
	       UserVo logInUser = (UserVo) session.getAttribute("login");

	       //로그인 여부 확인
	       if (logInUser != null) {
	          mv.addObject("logInUser", false);
	          mv.addObject("logOutUser", true);
	       }
	       else {
	          mv.addObject("logInUser", true);
	          mv.addObject("logOutUser", false);
	       }
	       // 관리자 여부 확인
	       if (logInUser != null && "admin".equals(logInUser.getUser_id())) {
	           mv.addObject("admin", true);
	       } else {
	           mv.addObject("admin", false);
	       }

	       mv.setViewName("home");
	       return mv;
	   }
}


/*
4. 메뉴바 연결
*/