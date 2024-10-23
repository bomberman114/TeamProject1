package com.green.company.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.servlet.ModelAndView;

import com.green.common.company.recruit.skill.mapper.CommonCompanyRecruitSkillMapper;
import com.green.company.mapper.CompanyMapper;
import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.users.vo.CompanyUserVo;
import com.green.region.mapper.RegeionMapper;
import com.green.region.vo.RegionVo;
import com.green.skill.mapper.SkillMapper;
import com.green.skills.vo.SkillVo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Company")
public class CompanyController {

	ModelAndView mv = new ModelAndView();
	
	@Autowired
	private CompanyRecruitMapper companyRecruitMapper;
	
	@Autowired
	private RegeionMapper regionMapper;
	
	@Autowired
	private SkillMapper skillMapper;
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private CommonCompanyRecruitSkillMapper commonCompanyRecruitSkillMapper;
	
	
	@RequestMapping("/List")
	public ModelAndView list () {
		return mv;
	}
	
	@RequestMapping("/RecruitWriteForm")
	public ModelAndView recruitWriteForm (CompanyUserVo companyUserVo) {
		List<RegionVo> regionList = regionMapper.getRegionList();
		List<SkillVo> skillList   = skillMapper.getSkillList();
		companyUserVo.setCompany_id("kaka01");
		companyUserVo 			  = companyMapper.getCompanyUser(companyUserVo);
		//System.out.println(companyUserVo);
		//System.out.println(skillList);
		
		mv.addObject("companyUserVo", companyUserVo);
		mv.addObject("skillList",     skillList);
		mv.addObject("regionList",    regionList);
		mv.setViewName("/company/recruitWriteForm");
		return mv;
	}
	
	@RequestMapping("/RecruitWrite")
	public ModelAndView recruitWrite (HttpServletRequest request, CompanyRecruitVo companyRecruitVo  ) {
		Map<String, String[]> companyRecruitmap = request.getParameterMap();
		String [] skills = companyRecruitmap.get("skill_name");
		System.out.println( Arrays.toString(skills));
		System.out.println( companyRecruitVo );
		
		companyRecruitMapper.setCompanyRecruit(companyRecruitVo);
		int company_recruit_idx = companyRecruitMapper.getCompanyRecruitIdx(companyRecruitVo.getCompany_id()); 
		System.out.println(company_recruit_idx);
		List<SkillVo> skillList = new ArrayList<>();
		for(int i =0; i< skills.length; i++ ) {
			SkillVo skillVo = new SkillVo();
			skillVo.setSkill_name(skills[0]);
			skillList.set(i, skillVo);
		};
		//commonCompanyRecruitSkillMapper.setCommonCompanyRecruitSkill(company_recruit_idx, skillList);
		
		mv.setViewName("/company/recruitWriteForm");
		return mv;
	}
		
		/*
	}@RequestMapping("/Write2")
	public  String  write(HttpServletRequest request) {
		Map<String, String[]> parms = request.getParameterMap();
		String [] job1 = parms.get("job1");
		System.out.println( Arrays.toString(job1) );
		System.out.println("-------------------");
		for (Map.Entry<String, String[]> entry : parms.entrySet()) {
			String   key  = entry.getKey();
			String[] vals = entry.getValue();
			for (int i = 0; i < vals.length; i++) {
				System.out.println(key + ":" + vals[i]);				
			}
		}
			
		return "home1";
	}
	*/
	
	
	@RequestMapping("/RecruitList")
	public ModelAndView recruitList () {
		CompanyUserVo companyUserVo = new CompanyUserVo();
		companyUserVo.setCompany_id("kaka01");
		List<CompanyRecruitVo> companyRecruitList = companyRecruitMapper.selectCompanyRecruitList(companyUserVo);
		//System.out.println(companyRecruitList);
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
