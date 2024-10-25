package com.green.company.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.paging.vo.Pagination;
import com.green.paging.vo.PagingResponse;
import com.green.common.company.recruit.skill.mapper.CommonCompanyRecruitSkillMapper;
import com.green.company.mapper.CompanyMapper;
import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.users.vo.CompanyUserVo;
import com.green.paging.vo.SearchVo;
import com.green.region.mapper.RegeionMapper;
import com.green.region.vo.RegionVo;
import com.green.skill.mapper.SkillMapper;
import com.green.skills.vo.SkillVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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

	
	@RequestMapping("/RecruitInfo")
    public ModelAndView recruitInfoPaging(@RequestParam(value="nowpage", required =false)  Integer nowpage ,
    		                              @RequestParam(value = "pageSize", required = false) Integer pageSize , 
    		                              CompanyUserVo companyUserVo ) {

		if( nowpage== null ) {
			nowpage=1;
			pageSize=5;
		};
		 		
		
		
        companyUserVo.setCompany_id("kaka01");
        companyUserVo = companyMapper.getCompanyUser(companyUserVo);
		
		int count = companyRecruitMapper.getCompanyRecruitCount(companyUserVo);
		
		PagingResponse<CompanyRecruitVo> response = null;
	    if( count < 1 ) {   // 현재 Menu_id 조회한 자료가 없다면
	    	response = new PagingResponse<>(
	    		Collections.emptyList(), null);
	    	// Collections.emptyList() : 자료는 없는 빈 리스트를 채운다
	    }
		
	    
		SearchVo  searchVo = new SearchVo();
		searchVo.setPage(nowpage);   // 현재 페이지 정보
		searchVo.setRecordSize(5);   // 페이지당 10개
		searchVo.setPageSize(10);    // paging.jsp 에 출력할 페이지번호수  
		
		
		
		Pagination  pagination = new Pagination(count, searchVo);
		searchVo.setPagination(pagination);
	

        //System.out.println(companyUserVo);
        
        int      startRow      =  searchVo.getOffset();
	    int      endRow        =  searchVo.getRecordSize();
	    
        
	   
        List<CompanyRecruitVo> companyRecruitList = companyRecruitMapper.selectCompanyRecruitListPaging(
                companyUserVo.getCompany_id(), startRow, endRow);
        response = new PagingResponse<>(companyRecruitList, pagination);
        
        int totalPages = (int) Math.ceil((double) count / pageSize);
        

        ModelAndView mv = new ModelAndView();
        mv.addObject( "companyUserVo", companyUserVo );
        mv.addObject( "companyRecruitList", companyRecruitList );
        mv.addObject( "currentPage", nowpage );
        mv.addObject( "pageSize", pageSize );
        mv.setViewName( "/company/recruitInfo" );
        mv.addObject( "response" , response );
        mv.addObject("recruitCount", count);
        mv.addObject("totalPages", totalPages);
        
        return mv;      
        }
	

	
	    @RequestMapping("/Info")
	    public ModelAndView Info(HttpSession session) {
	        String company_id = (String) session.getAttribute("company_id");
	      
	        /*
	        if (companyId == null) {
	            mv.setViewName("redirect:/Company/login");
	            return mv;
	        }
	        */
	        System.out.println(company_id);
	        CompanyUserVo companyUserVo = companyMapper.getInfoUser(company_id);
	        
	   
	        mv.addObject("companyUser", companyUserVo);
	        mv.setViewName("/company/info");

	        return mv;
	    }
	    
}