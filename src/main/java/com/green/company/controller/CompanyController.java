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

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.green.common.company.recruit.skill.mapper.CommonCompanyRecruitSkillMapper;
import com.green.company.mapper.CompanyMapper;
import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.users.vo.CompanyUserVo;
import com.green.paging.vo.SearchVo;
import com.green.company.users.mapper.CompanyUserMapper;
import com.green.company.users.vo.CompanyUserVo;

import com.green.paging.vo.Pagination;
import com.green.region.mapper.RegeionMapper;
import com.green.region.vo.RegionVo;
import com.green.skill.mapper.SkillMapper;
import com.green.skills.vo.SkillVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
	
	@Autowired
	private CompanyUserMapper companyUserMapper;

	@Autowired
	private CompanyUserMapper companyUserMapper;
	
	
	
	@RequestMapping("/RecruitWriteForm")
	public ModelAndView recruitWriteForm (CompanyUserVo companyUserVo) {
		
		List<RegionVo> regionList = regionMapper.getRegionList();
		List<SkillVo> skillList   = skillMapper.getSkillList();

		companyUserVo.setCompany_id("naver01");

		companyUserVo 			  = companyMapper.getCompanyUser(companyUserVo);
		
		mv.addObject("companyUserVo", companyUserVo);
		mv.addObject("skillList",     skillList);
		mv.addObject("regionList",    regionList);
		mv.setViewName("/company/recruitWriteForm");
		return mv;
	}
	
	// 채용공고 등록
	@RequestMapping("/RecruitWrite")
	public ModelAndView recruitWrite (HttpServletRequest request, CompanyRecruitVo companyRecruitVo  ) {
		Map<String, String[]> companyRecruitmap = request.getParameterMap();
		String [] skills = companyRecruitmap.get("skill_name");

		System.out.println( Arrays.toString(skills));
		System.out.println( companyRecruitVo );
		
		companyRecruitMapper.setCompanyRecruit(companyRecruitVo);
		
		
	
		
		List<SkillVo> skillList = new ArrayList<>();
		
		for(int i =0; i< skills.length; i++ ) {
			SkillVo skillVo = new SkillVo();
			skillVo.setSkill_name(skills[i]);
			skillList.add(skillVo);
		};
		
		companyRecruitMapper.setCompanyRecruit(companyRecruitVo);
		  
		companyRecruitVo.setCompany_recruit_idx(companyRecruitMapper.getCompanyRecruitIdx(companyRecruitVo.getCompany_id()));
		int company_recruit_idx = companyRecruitVo.getCompany_recruit_idx();
		commonCompanyRecruitSkillMapper.setCommonCompanyRecruitSkill(company_recruit_idx, skillList);

		
		mv.setViewName("/company/recruitWriteForm");
		return mv;
	}

	
	@RequestMapping("/RecruitList")
	public ModelAndView recruitList () {
		CompanyUserVo companyUserVo = new CompanyUserVo();
		companyUserVo.setCompany_id("kaka01");
		List<CompanyRecruitVo> companyRecruitList = companyRecruitMapper.selectCompanyRecruitList(companyUserVo);
		mv.addObject("companyRecruitList", companyRecruitList);
		mv.setViewName("/company/recruitList");
		return mv;
	}
	
	@RequestMapping("/Recruit")
	public ModelAndView recruit (CompanyRecruitVo companyRecruitVo) {
		companyRecruitVo.setCompany_recruit_idx(1);
		HashMap<String, Object> companyRecruitMap = companyRecruitMapper.getCompanyRecruit(companyRecruitVo);

		
		return mv;
	}
	
	@RequestMapping("/RecruitAplications")
	public ModelAndView recruitAplications (CompanyRecruitVo companyRecruitVo) {
		companyRecruitVo.setCompany_recruit_idx(1);
		HashMap<String, Object> recruitAplicationsMap = companyRecruitMapper.getCompanyRecruitAlications(companyRecruitVo);

		
		return mv;
	} 

	
	@RequestMapping("/RecruitInfo")
    public ModelAndView recruitInfo(@RequestParam(value="nowpage", required =false)  Integer nowpage ,
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
	        company_id = "kaka01";
	        /*
	        if (companyId == null) {
	            mv.setViewName("redirect:/Company/login");
	            return mv;
	        }
	        */
	        CompanyUserVo companyUserVo = companyMapper.getInfoUser(company_id);

	        mv.addObject("companyUserVo", companyUserVo);
	        mv.setViewName("/company/info");

	        return mv;
	    }

	
	// 기업회원 추가
	
	// /Users/RegisterForm
	@RequestMapping("/RegisterForm")
	public  ModelAndView registerForm() {	
		ModelAndView  mv = new ModelAndView();
		mv.setViewName("company/registerform");
		return  mv;
	}
	
	@RequestMapping("/Register")
	public  ModelAndView  register( CompanyUserVo companyUserVo ) {
		System.out.println(companyUserVo);
		companyUserMapper.insertCompanyUser( companyUserVo );
		ModelAndView  mv  =  new ModelAndView();
		mv.setViewName("redirect:/");
		return  mv;
	}
	
	// 아이디 중복 체크
	@RequestMapping("/CheckDuplication")
	@ResponseBody
	public String checkDuplication(@RequestParam("company_id") String company_id) {
	    CompanyUserVo companyUserVo = companyUserMapper.getCompanyUserById(company_id);
	    if (companyUserVo == null) {
	        return "가능";  // 아이디가 존재하지 않으면 가능
	    }
	    return "불가능";  // 아이디가 존재하면 불가능
	}


	
	// 회원 삭제
	@RequestMapping("/Delete")
	public  ModelAndView delete(CompanyUserVo companyUserVo) {
		companyUserMapper.deleteCompanyUser( companyUserVo );
		ModelAndView  mv  =  new ModelAndView();
		mv.setViewName("redirect:/company/List");
		return mv;
	}
	
	// 회원정보 수정
	// 비밀번호 확인 후 수정 페이지로 이동

    

  	@RequestMapping("/CheckPassword")
  	public ModelAndView checkPassword(@RequestParam("company_id") String company_id, @RequestParam(value = "inputPassword", required = false) String inputPassword) {
    CompanyUserVo companyUser = companyUserMapper.getCompanyUserById(company_id);
    ModelAndView mv = new ModelAndView();
    
    
    // 입력된 비밀번호가 null이거나 비어있는 경우
    if (inputPassword == null || inputPassword.isEmpty()) {
        mv.setViewName("companyUsers/checkPassword");
        return mv;
    }
    // 입력된 비밀번호와 DB의 비밀번호를 비교
    if (companyUser.getCompany_passwd().equals(inputPassword)) {
        // 비밀번호가 일치하면 수정 페이지로 이동
        mv.setViewName("redirect:/companyUsers/UpdateForm?company_id=" + company_id);
    } else {
        // 비밀번호가 틀리면 오류 메시지와 함께 비밀번호 확인 페이지로 다시 이동
        mv.setViewName("companyUsers/checkPassword");
        mv.addObject("error", "비밀번호가 일치하지 않습니다.");
    }
    return mv;
  	}

	@RequestMapping("/UpdateForm")
	public  ModelAndView  updateForm(CompanyUserVo companyUserVo) {
		CompanyUserVo  companyUser =  companyUserMapper.getCompanyUser( companyUserVo );
		ModelAndView  mv  =  new ModelAndView();
		mv.setViewName("companyUsers/updateform");
		mv.addObject("companyUser", companyUser);
		return        mv;
	}
	
	// /Users/Update
	@RequestMapping("/Update")
	public  ModelAndView  update(CompanyUserVo companyUserVo) {
		companyUserMapper.updateCompanyUser(companyUserVo);
		ModelAndView  mv  =  new ModelAndView();
		mv.setViewName("redirect:/Company/List");
		return        mv;
	}
	//-------------------------------------------------------------------
	// Login
	// /Users/LoginForm
	@GetMapping("/LoginForm")
	public  String  loginForm(
			@RequestParam(value = "uri", required = false) String uri, Model model) {
		model.addAttribute("uri",     uri);
		//model.addAttribute("nowpage", nowpage);
		return "company/loginform";
	}
	
	
	// /Users/Login
	@PostMapping("/Login")
	public  String   login(
		HttpServletRequest   request,
		HttpServletResponse  response
		) {
		String company_id  = request.getParameter("company_id");
		String company_passwd  = request.getParameter("company_passwd");
		
		// db 조회
		CompanyUserVo companyUserVo    = companyUserMapper.login(company_id, company_passwd);
		System.out.println(companyUserVo);
			
		HttpSession  session = request.getSession();
		session.setAttribute( "login", companyUserVo );
		
		return  "redirect:/";
		
	}

    // /Users/Logout
    @RequestMapping(value="/Logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/"; // 홈으로 리다이렉트
    }
    
    
    @RequestMapping("/OneRecruit")
    public ModelAndView onerecruit(HttpSession session,
    		                       @RequestParam(name="company_recruit_idx") int company_recruit_idx) {
        String company_id = (String) session.getAttribute("company_id");

        System.out.println(company_recruit_idx);
        CompanyRecruitVo companyRecruitVo = companyRecruitMapper.getCompanyOneRecruit(company_recruit_idx); 
        
        
        
        mv.addObject("companyRecruitVo",companyRecruitVo);
        mv.setViewName("/company/oneRecruit");
        

        return mv;
    }  
    

    
    
    
    
    
    
    @RequestMapping("/EditRecruit")
    public ModelAndView editRecruit(@RequestParam("company_recruit_idx") int company_recruit_idx) {
        ModelAndView mv = new ModelAndView();

        CompanyRecruitVo companyRecruitVo = companyRecruitMapper.getCompanyOneRecruit(company_recruit_idx);
        mv.addObject("companyRecruitVo", companyRecruitVo);
        mv.setViewName("/company/editRecruit"); // 수정 페이지 JSP 이름

        return mv;
    }
    
    @RequestMapping(value = "/DeleteRecruit", method = RequestMethod.POST)
    public String deleteRecruit(@RequestParam("company_recruit_idx") int company_recruit_idx) {
        companyRecruitMapper.deleteRecruit(company_recruit_idx); // 삭제 로직
        return "redirect:/RecruitList"; // 삭제 후 이동할 페이지
    }
    
   
	
}
