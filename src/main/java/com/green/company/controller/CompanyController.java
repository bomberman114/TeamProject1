package com.green.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.users.vo.CompanyUserVo;

@Controller
@RequestMapping("/Company")
public class CompanyController {

	ModelAndView mv = new ModelAndView();
	
	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;
	
	
	@RequestMapping("/List")
	public ModelAndView list () {
		return mv;
	}
	
	
	@RequestMapping("/RecruitList")
	public ModelAndView list (CompanyUserVo companyUserVo) {
		companyUserVo.setCompany_id("kaka01");
		List<CompanyRecruitVo> companyRecruitList = companyRecruitMapper.selectCompanyRecruitList(companyUserVo);
		System.out.println(companyRecruitList);
		mv.addObject("companyRecruitList", companyRecruitList);
		mv.setViewName("/company/recruitList");
		return mv;
	}
	
	
}
