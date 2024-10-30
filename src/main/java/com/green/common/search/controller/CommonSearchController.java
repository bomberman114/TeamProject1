package com.green.common.search.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.application.mapper.ApplicationsMapper;
import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.paging.vo.Pagination;
import com.green.paging.vo.PagingResponse;
import com.green.paging.vo.SearchVo;
import com.green.region.mapper.RegeionMapper;
import com.green.region.vo.RegionVo;
import com.green.skill.mapper.SkillMapper;
import com.green.skills.vo.SkillVo;
import com.green.user.resume.mapper.UserResumeMapper;
import com.green.user.resume.vo.UserResumeVo;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Common")
public class CommonSearchController {

	ModelAndView mv= new ModelAndView();
	
	@Autowired
	private SkillMapper skillMapper;
	
	@Autowired
	private RegeionMapper regionMapper;
	
	@Autowired
	private CompanyRecruitMapper companyRecruitMapper; 
	
	@Autowired
	private UserResumeMapper userResumeMapper;
	
	@Autowired
	private ApplicationsMapper applicationsMapper; 
	
	
	@RequestMapping("/RecruitSearchForm")
	public ModelAndView recruitSearchForm () {
		List<SkillVo> skillList   = skillMapper.getSkillList();
		List<RegionVo> regionList = regionMapper.getRegionList();
		String recruit_title = null;
		
		//System.out.println(skillList);
		//System.out.println(regionList);
		mv.addObject("recruit_title", recruit_title);
		mv.addObject("skillList", skillList);
		mv.addObject("regionList", regionList);
		mv.setViewName("/common/recruitSearchForm");
		return mv;
	}
	
	@RequestMapping("/RecruitSearch")
	public ModelAndView recruitSearch (HttpServletRequest request, 
										@RequestParam(name = "recruit_title",required =false) String recruit_title,
										@RequestParam(value="nowpage"    ,required =false) Integer nowpage ,
		    		                    @RequestParam(value = "pageSize" ,required =false) Integer pageSize
			) {
		if( nowpage == null && pageSize == null ) {
			nowpage = 1;
			pageSize = 10;
		};
		
		
		Map<String, String[]> map = request.getParameterMap();
		String [] skills = map.get("skill_name");
		String [] regions = map.get("region_idx");
		List<SkillVo> skillListCheck   = new ArrayList<>();
		List<RegionVo> regionListCheck = new ArrayList<>();
		if (skills != null) {
			for(int i = 0; i < skills.length; i++) {
				SkillVo skillVo = new SkillVo();
				skillVo.setSkill_name(skills[i]);
				skillListCheck.add(skillVo);
			};
		};
		if(regions != null) {
			
			for(int i = 0; i < regions.length; i++) {
				RegionVo regionVo = new RegionVo();
				regionVo.setRegion_idx(Integer.parseInt(regions[i]));
				regionListCheck.add(regionVo);
			};
			
		};
		if (skills == null) {
			skillListCheck = null;
		};
		if(regions == null) {
			regionListCheck = null;
			
		};
		
		
		int count = companyRecruitMapper.getCompanyRecruitListCount(recruit_title, skillListCheck, regionListCheck);
		
		PagingResponse<CompanyRecruitVo> response = null;
	    if( count < 1 ) {   // 현재 Menu_id 조회한 자료가 없다면
	    	response = new PagingResponse<>(
	    		Collections.emptyList(), null);
	    	// Collections.emptyList() : 자료는 없는 빈 리스트를 채운다
	    }
	    
	    SearchVo  searchVo = new SearchVo();
		searchVo.setPage(nowpage);   // 현재 페이지 정보
		searchVo.setRecordSize(pageSize);   // 페이지당 10개
		searchVo.setPageSize(10);    // paging.jsp 에 출력할 페이지번호수  
		
		Pagination  pagination = new Pagination(count, searchVo);
		searchVo.setPagination(pagination);
		
		 int      startRow      =  searchVo.getOffset();
		 int      endRow        =  searchVo.getRecordSize();
		
		List<HashMap<String, String>> companyRecruitList =  
				companyRecruitMapper.getCompanyRecruitList(  recruit_title 
														   , skillListCheck 
														   , regionListCheck
														   , startRow
														   , endRow );
		
		List<SkillVo> skillList = skillMapper.getSkillList(); 
		List<RegionVo> regionList = regionMapper.getRegionList();
		
		
		
		mv.addObject("nowpage" , nowpage);
		mv.addObject("pageSize" , pageSize);
		mv.addObject("pagination", pagination);
		mv.addObject("companyRecruitList" , companyRecruitList);
		mv.addObject("recruit_title",  recruit_title);
		mv.addObject("skillList",  skillList);
		mv.addObject("skillListCheck",  skillListCheck);
		mv.addObject("regionList", regionList);
		mv.addObject("regionListCheck", regionListCheck);
		mv.setViewName("/common/recruitSearchForm");
		return mv;
	}
	
	@RequestMapping("/RecruitInfo")
	public ModelAndView recruitInfro (HttpSession session ,CompanyRecruitVo companyRecruitVo,@RequestParam(value="message",required =false) String message) {
		ModelAndView mv = new ModelAndView();
		UserVo userVo = (UserVo) session.getAttribute("userLogin");
		List<UserResumeVo> userResumeIdxList = userResumeMapper.getResumeIdx(userVo);
		companyRecruitVo = companyRecruitMapper.getCompanyOneRecruit(companyRecruitVo.getCompany_recruit_idx());
		int views = companyRecruitVo.getViews(); 
		companyRecruitVo.setViews(views++);
		HashMap<String, String> companyOneRecruit = companyRecruitMapper.getCompanyOneRecruitData(companyRecruitVo);
		int applicationsCount = applicationsMapper.getApplicationsCount(companyRecruitVo.getCompany_recruit_idx(), userResumeIdxList);
		if(applicationsCount == 0) {
			message = "지원가능";
		};
		if(applicationsCount != 0){
			message = "지원불가능";
		};
		
		mv.addObject("message" , message);
		mv.addObject("companyOneRecruit" , companyOneRecruit);
		mv.setViewName("/common/recruitInfo");
		return mv;
		
	}
	
	
	
	
}
