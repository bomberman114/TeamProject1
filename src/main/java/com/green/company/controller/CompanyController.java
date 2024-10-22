package com.green.company.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.users.vo.CompanyUserVo;
import com.green.region.mapper.RegeionMapper;
import com.green.region.vo.RegionVo;

@Controller
@RequestMapping("/Company")
public class CompanyController {

	ModelAndView mv = new ModelAndView();
	
	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;
	
	@Autowired
	private RegeionMapper regionMapper;
	
	
	@RequestMapping("/List")
	public ModelAndView list () {
		return mv;
	}
	
	@RequestMapping("/RecruitWriteForm")
	public ModelAndView recruitWriteForm () {
		List<RegionVo> regionList = regionMapper.getRegionList();
		System.out.println(regionList);
		mv.addObject("regionList", regionList);
		mv.setViewName("/company/recruitWriteForm");
		return mv;
	}
	
	
	@RequestMapping("/RecruitList")
	public ModelAndView recruitList () {
		CompanyUserVo companyUserVo = new CompanyUserVo();
		companyUserVo.setCompany_id("kaka01");
		List<CompanyRecruitVo> companyRecruitList = companyRecruitMapper.selectCompanyRecruitList(companyUserVo);
		System.out.println(companyRecruitList);
		mv.addObject("companyRecruitList", companyRecruitList);
		mv.setViewName("/company/recruitList");
		return mv;
	}
	
	@RequestMapping("/Recruit")
	public ModelAndView recruit (CompanyRecruitVo companyRecruitVo) {
		companyRecruitVo.setCompany_recruit_idx(1);
		HashMap<String, Object> companyRecruitMap = companyRecruitMapper.getCompanyRecruit(companyRecruitVo);
		System.out.println(companyRecruitMap);
		
		return mv;
	}
	
	@RequestMapping("/RecruitAplications")
	public ModelAndView recruitAplications (CompanyRecruitVo companyRecruitVo) {
		companyRecruitVo.setCompany_recruit_idx(1);
		HashMap<String, Object> recruitAplicationsMap = companyRecruitMapper.getCompanyRecruitAlications(companyRecruitVo);
		System.out.println(recruitAplicationsMap);
		
		return mv;
	}
	
}
