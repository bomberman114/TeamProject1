package com.green.company.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.users.mapper.CompanyUserMapper;
import com.green.company.users.vo.CompanyUserVo;
import com.green.users.vo.UserVo;

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
	private  CompanyUserMapper  companyUserMapper;
	
	
	@RequestMapping("/List")
	public ModelAndView list () {
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
	
	
}
