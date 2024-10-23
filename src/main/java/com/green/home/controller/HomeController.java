package com.green.home.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;

@Controller
public class HomeController {
	
	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		List<CompanyRecruitVo> companyRecruitList = companyRecruitMapper.companyRecruitList();
		System.out.println(companyRecruitList);
		mv.addObject("companyRecruitList", companyRecruitList); // 리스트 추가
		mv.setViewName("home");
		return mv;
	}
}


/*
2. 공고검색 연결
4. 메뉴바 연결
*/