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


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.green.applicaions.vo.ApplicaionVo;
import com.green.application.mapper.ApplicationsMapper;
import com.green.common.company.recruit.skill.mapper.CommonCompanyRecruitSkillMapper;
import com.green.company.mapper.CompanyMapper;
import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.users.vo.CompanyUserVo;
import com.green.paging.vo.SearchVo;
import com.green.company.users.mapper.CompanyUserMapper;

import com.green.region.mapper.RegeionMapper;
import com.green.region.vo.RegionVo;
import com.green.skill.mapper.SkillMapper;
import com.green.skills.vo.SkillVo;

import com.green.users.vo.UserVo;

import com.green.user.resume.mapper.UserResumeMapper;
import com.green.user.resume.vo.UserResumeVo;


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
   private ApplicationsMapper applicationsMapper;
   
   @Autowired
   private UserResumeMapper userResumeMapper;
   
   
   //채용 공고 등록 폼
   @RequestMapping("/RecruitWriteForm")
   public ModelAndView recruitWriteForm (HttpSession session ,CompanyUserVo companyUserVo) {
      
	   
      List<RegionVo> regionList = regionMapper.getRegionList();
      List<SkillVo> skillList   = skillMapper.getSkillList();

      companyUserVo = (CompanyUserVo) session.getAttribute("companyUserLogin");
      
      companyUserVo            = companyMapper.getCompanyUser(companyUserVo);
      
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
      
      
      List<SkillVo> skillList = new ArrayList<>();
      
      int company_recruit_idx = companyRecruitVo.getCompany_recruit_idx();
     
      if( skills != null) {
    	  for(int i =0; i< skills.length; i++ ) {
    		  SkillVo skillVo = new SkillVo();
    		  skillVo.setSkill_name(skills[i]);
    		  skillList.add(skillVo);
    	  };
    	  commonCompanyRecruitSkillMapper.setCommonCompanyRecruitSkill(company_recruit_idx, skillList);
      };
      companyRecruitMapper.setCompanyRecruit(companyRecruitVo);
        
      companyRecruitVo.setCompany_recruit_idx(companyRecruitMapper.getCompanyRecruitIdx(companyRecruitVo.getCompany_id()));
    

      
      mv.setViewName("redirect:/Company/RecruitInfo");
      return mv;
   }

   // 채용공고 리스트
   @RequestMapping("/RecruitList")
   public ModelAndView recruitList () {
      CompanyUserVo companyUserVo = new CompanyUserVo();
      companyUserVo.setCompany_id("kaka01");
      List<CompanyRecruitVo> companyRecruitList = companyRecruitMapper.selectCompanyRecruitList(companyUserVo);
      mv.addObject("companyRecruitList", companyRecruitList);
      mv.setViewName("/company/recruitList");
      return mv;
   }
   
   
   
   

   // 채용공고 보여주기
   @RequestMapping("/RecruitInfo")
   public ModelAndView recruitInfo(@RequestParam(value="nowpage", required =false)  Integer nowpage ,
                                        @RequestParam(value = "pageSize", required = false) Integer pageSize , 
                                        CompanyUserVo companyUserVo, HttpSession session ) {
      if( nowpage== null ) {
         nowpage=1;
         pageSize=5;
      };
      
      companyUserVo = (CompanyUserVo) session.getAttribute("companyUserLogin"); 

        //companyUserVo.setCompany_id("kaka01");
        companyUserVo = companyMapper.getCompanyUser(companyUserVo);
      
      int count = companyRecruitMapper.getCompanyRecruitCount(companyUserVo);
      
      PagingResponse<CompanyRecruitVo> response = null;
       if( count < 1 ) {   // 현재 Menu_id 조회한 자료가 없다면
          response = new PagingResponse<>(
             Collections.emptyList(), null);
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
        mv.addObject( "response" , response );
        mv.addObject("recruitCount", count);
        mv.addObject("totalPages", totalPages);
        mv.setViewName( "/company/recruitInfo" );
        
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
   @RequestMapping("/CompanyDelete")
   public  ModelAndView delete(CompanyUserVo companyUserVo) {
      companyUserMapper.deleteCompanyUser( companyUserVo );
      ModelAndView  mv  =  new ModelAndView();
      mv.setViewName("redirect:/");
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
         @RequestParam(value = "uri", required = false) String uri, Model model, @RequestParam( value = "loginFalseMessage", required = false ) String loginFalseMessage) {
      model.addAttribute("uri",     uri);
      model.addAttribute("loginFalseMessage",     loginFalseMessage);
      //model.addAttribute("nowpage", nowpage);
      return "company/loginform";
   }
   
   
   // /Users/Login
   @PostMapping("/Login")
   public  String   login( Model model,
      HttpServletRequest   request,
      HttpServletResponse  response
      ) {
      String company_id  = request.getParameter("company_id");
      String company_passwd  = request.getParameter("company_passwd");
      
      // db 조회
      CompanyUserVo companyUserVo    = companyUserMapper.login(company_id, company_passwd);
      String loginFalseMessage = "";
      if( companyUserVo != null ) {
    	  HttpSession  session = request.getSession();
    	  session.setAttribute( "companyUserLogin", companyUserVo );
    	  session.setMaxInactiveInterval(60*60);
      };         
      if( companyUserVo == null ) {
    	  loginFalseMessage = "다시 로그인 시도해주세요";
    	  model.addAttribute("loginFalseMessage",     loginFalseMessage);
    	  return "redirect:/Company/LoginForm";
      };
      
      return  "redirect:/";
      
   }

    // 유저 로그아웃
    @RequestMapping(value="/Logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/"; // 홈으로 리다이렉트
    }

    
    // 채용공고 상세보기
    @RequestMapping("/OneRecruit")
    public ModelAndView onerecruit(HttpSession session,
                                 @RequestParam(name="company_recruit_idx") int company_recruit_idx) {
    	
        String company_id = (String) session.getAttribute("company_id");


        CompanyRecruitVo companyRecruitVo = new CompanyRecruitVo();
        companyRecruitVo.setCompany_recruit_idx(company_recruit_idx);
        HashMap<String, String> companyOneRecruit = companyRecruitMapper.getCompanyOneRecruitData(companyRecruitVo);
        
        mv.addObject("companyOneRecruit",companyOneRecruit);
        mv.setViewName("/company/oneRecruit");
        

        return mv;
    }  
    
    //채용공고 업데이트 폼
    @RequestMapping("/RecruitUpdateForm")
    public ModelAndView recruitUpdateForm (CompanyRecruitVo companyRecruitVo) {

    	ModelAndView mv = new ModelAndView();
    	
    	HashMap<String, String> companyOneRecruit = companyRecruitMapper.getCompanyOneRecruitData(companyRecruitVo);
        List<SkillVo> skillList = skillMapper.getSkillList();
        List<RegionVo> regionList = regionMapper.getRegionList();
        

        mv.addObject("skillList",skillList);
        mv.addObject("regionList",regionList);
        mv.addObject("companyOneRecruit",companyOneRecruit);
        mv.setViewName("/company/recruitUpdateForm");
       
       return mv;
       
    }
    @RequestMapping("/RecruitUpdate")

   	public ModelAndView recruitUpdate (HttpServletRequest request, CompanyRecruitVo companyRecruitVo,RegionVo regionVO  ) {
   		Map<String, String[]> companyRecruitmap = request.getParameterMap();
   		String [] skills = companyRecruitmap.get("skill_name");
   		
   		companyRecruitMapper.setCompanyRecruitUpdate(companyRecruitVo);
   		
   		List<SkillVo> skillList = new ArrayList<>();
   		
   		int company_recruit_idx = companyRecruitVo.getCompany_recruit_idx();
   		
   		if( skills != null) {
   			for(int i =0; i< skills.length; i++ ) {
   				SkillVo skillVo = new SkillVo();
   				skillVo.setSkill_name(skills[i]);
   				skillList.add(skillVo);
   			};
   			commonCompanyRecruitSkillMapper.setCommonCompanyRecruitSkill(company_recruit_idx, skillList);
   		};
   		if( skills == null) {
   			skillList = null;
   			commonCompanyRecruitSkillMapper.setCommonCompanyRecruitSkillNotSkill(company_recruit_idx);
   		};
   		commonCompanyRecruitSkillMapper.deletCommonCompanyRecruitSkill(company_recruit_idx);

   		mv.setViewName("redirect:/Company/OneRecruit?company_recruit_idx="+companyRecruitVo.getCompany_recruit_idx());
   		return mv;
   	}

   


    

    
    	//회사정보 수정 폼
  		@RequestMapping("/InfoUpdateForm")
  		public ModelAndView infoEdit(CompanyUserVo companyUserVo) {
          String company_id;
          
          company_id = companyUserVo.getCompany_id();
          
          companyUserVo = companyMapper.getInfoUser(company_id);
          ModelAndView mv = new ModelAndView();
          mv.addObject("companyUserVo", companyUserVo);
          mv.setViewName("/company/infoUpdateForm");
          
          return mv;
  		}
  		
  		//내 회사정보 수정
  		@RequestMapping(value = "/InfoUpdate", method = RequestMethod.POST)
  		public String InfoUpdate(CompanyUserVo companyUserVo, HttpSession session) {
  		    System.out.println("Updated CompanyUserVo: " + companyUserVo);
  		    
  		    companyMapper.updateInfoUser(companyUserVo);
  		    session.setAttribute("companyUserLogin", companyUserVo);
  		    
  		    session.setMaxInactiveInterval(60*60);
  		    
  		    return "redirect:/Company/Info";
  		}

  		
  		//내 회사 정보 보기
        @RequestMapping("/Info")
        public ModelAndView info(HttpSession session) {
            CompanyUserVo companyUserLogin = (CompanyUserVo) session.getAttribute("companyUserLogin");
            String company_id = companyUserLogin.getCompany_id();
            
           
            CompanyUserVo companyUserVo = companyMapper.getInfoUser(company_id);
            mv.addObject("companyUserVo", companyUserVo);
            mv.setViewName("/company/info");

            return mv;
        }

        //채용공고 상세보기에서 삭제
        @RequestMapping( "/DeleteRecruit" )
        public  ModelAndView deleteRecruit( CompanyRecruitVo companyRecruitVo ) {
        	
           applicationsMapper.deletApplicstionData(companyRecruitVo.getCompany_recruit_idx());
           commonCompanyRecruitSkillMapper.deletCommonCompanyRecruitSkill(companyRecruitVo.getCompany_recruit_idx());
           companyRecruitMapper.deleteCompanyRecruit( companyRecruitVo.getCompany_recruit_idx() );
           ModelAndView  mv  =  new ModelAndView();
           
           mv.setViewName("redirect:/Company/RecruitInfo");
           return mv;
        }
   


      
   // 채용공고에서 이력서온거 리스트보기 
    @RequestMapping("/ResumeViewList")
    public ModelAndView resumeViewList (@RequestParam(value="nowpage", required =false)  Integer nowpage ,
						            @RequestParam(value = "pageSize", required = false) Integer pageSize , 
						            CompanyRecruitVo companyRecruitVo, HttpSession session ) {
    	
    	ModelAndView mv = new ModelAndView();
    	System.out.println(companyRecruitVo);
		if( nowpage == null ) {
			nowpage=1;
			pageSize=5;
		};

		
		CompanyUserVo companyUserVo = (CompanyUserVo) session.getAttribute("companyUserLogin"); 
		
		
		int count = userResumeMapper.getRecruitResumeListCount(companyRecruitVo);
		
		
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
	

        
        int      startRow      =  searchVo.getOffset();
	    int      endRow        =  searchVo.getRecordSize();
	    
        
	    List<HashMap<String, String>> recruitResumeList = userResumeMapper.getRecruitResumeList(companyRecruitVo.getCompany_recruit_idx(), startRow, endRow);
        
        int totalPages = (int) Math.ceil((double) count / pageSize);
        

        mv.addObject( "companyUserVo", companyUserVo );
        mv.addObject( "recruitResumeList", recruitResumeList );
        mv.addObject( "currentPage", nowpage );
        mv.addObject( "pageSize", pageSize );
        mv.addObject( "response" , response );
        mv.addObject("recruitCount", count);
        mv.addObject("totalPages", totalPages);
        mv.setViewName( "/company/resumeViewList" );
        
        return mv;      
        }
    
    // 채용공고에서 이력서상세보기
    @RequestMapping("/OneResumeView")
    public ModelAndView resumeApplication (UserResumeVo userResumeVo, CompanyRecruitVo companyRecruitVo) {
    	ModelAndView mv = new ModelAndView();
    	HashMap<String, String> resumeResponMap = userResumeMapper.getUserResumeMap(userResumeVo.getUser_resume_idx(), companyRecruitVo.getCompany_recruit_idx());
    	//System.out.println(resumeResponMap);
    	mv.addObject("resumeResponMap",resumeResponMap);
    	mv.setViewName("/company/oneResumeView");
    	return mv;
    	
    }
    // 이력서 상태바꾸기
    @RequestMapping("/ChangeApplicationStatus")
    public ModelAndView changeApplicationStatus (ApplicaionVo applicationVo) {
    	ModelAndView mv = new ModelAndView();
    	applicationsMapper.setApplicationStatusData(applicationVo);
    	mv.setViewName("redirect:/Company/OneResumeView?user_resume_idx="+applicationVo.getUser_resume_idx()+
    			"&company_recruit_idx="+applicationVo.getCompany_recruit_idx());
    	return mv;
    	
    }
    
    
	
}
