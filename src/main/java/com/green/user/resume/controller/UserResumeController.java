package com.green.user.resume.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.applicaions.vo.ApplicaionVo;
import com.green.application.mapper.ApplicationsMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;
import com.green.user.resume.mapper.UserResumeMapper;
import com.green.user.resume.vo.UserResumeVo;
import com.green.users.vo.UserVo;

@Controller
@RequestMapping("/User")
public class UserResumeController {

	ModelAndView mv= new ModelAndView();
	
	@Autowired
	private UserResumeMapper userResumeMapper;
	
	@Autowired
	private ApplicationsMapper applicationsMapper;
	
	/*이력서 목록*/
	@RequestMapping("/ResumeList")
	public  ModelAndView  resumelist() {
		List<UserResumeVo>  userResumeList = userResumeMapper.getUserResumeList();
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("userResumeList", userResumeList);
		mv.setViewName("resume/list");
		return mv;
	}

	/*이력서 등록*/
	@RequestMapping("/RegisterResumeForm")
	public ModelAndView resumeregisterForm(UserResumeVo userResumeVo, UserVo userVo) {
	    ModelAndView mv = new ModelAndView();
	    String user_id= userVo.getUser_id();
	    mv.addObject("user_id", user_id);
	    
	    // Skill 리스트 가져오기
	    List<SkillVo> skillList = userResumeMapper.getSkill();
	    mv.addObject("skillList", skillList);

	    // Region 리스트 가져오기
	    List<RegionVo> regionList = userResumeMapper.getRegion(); 
	    mv.addObject("regionList", regionList);

	    mv.setViewName("resume/registerform");
	    return mv;
	}
	// 주소 입력 폼을 반환
    @RequestMapping("/SearchAddress")
    public String addressForm() {
        return "resume/address"; // /WEB-INF/views/resume/address.jsp를 반환
    }

    // 주소를 저장하는 POST 메서드

    @PostMapping("/Address")
    @ResponseBody
    public Map<String, String> saveAddress(@RequestParam("roadFullAddr") String roadFullAddr) {
        UserResumeVo userResumeVo = new UserResumeVo();
        userResumeVo.setRegion_address(roadFullAddr); // UserResumeVo에 주소 저장
        System.out.println("입력된 주소: " + roadFullAddr);

        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        response.put("address", roadFullAddr);

        return response; // JSON 형태로 데이터를 반환
    }

	
	@RequestMapping("/RegisterResume")
	public  ModelAndView resumeregister( UserResumeVo userResumeVo) {
		userResumeMapper.insertUserResume( userResumeVo );
		userResumeMapper.insertUserSkill( userResumeVo );
		ModelAndView  mv  =  new ModelAndView();
		mv.setViewName("redirect:/User/ResumeView");
		return  mv;
	}
	
	/* 이력서 보기 */
	@RequestMapping("/ViewResume")
	public  ModelAndView  resume( UserResumeVo userResumeVo ) {
		UserResumeVo  userResume =  userResumeMapper.getUserResume( userResumeVo );
		ModelAndView  mv  =  new ModelAndView();
		mv.setViewName("resume/view");
		mv.addObject("userResume", userResume);
		return mv;
	}
	
	/*이력서 수정*/
	@RequestMapping("/UpdateResumeForm")
	public  ModelAndView  updateResumeForm( UserResumeVo userResumeVo ) {
		UserResumeVo  userResume =  userResumeMapper.getUserResume( userResumeVo );
		ModelAndView  mv  =  new ModelAndView();
		mv.setViewName("resume/updateform");
		mv.addObject("userResume", userResume);
		return        mv;
	}
	

	@RequestMapping("/UpdateResume")
	public  ModelAndView  updateResume( UserResumeVo userResumeVo ) {
		userResumeMapper.updateUserResume( userResumeVo );
		userResumeMapper.updateUserResumeSkills( userResumeVo );
		ModelAndView  mv  =  new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return        mv;
	}
	
	/*이력서 삭제*/
	@RequestMapping("/Delete")
	public  ModelAndView delete( UserResumeVo userResumeVo ) {
		userResumeMapper.deleteUserResume( userResumeVo );
		userResumeMapper.deleteUserResumeSkills( userResumeVo );
		ModelAndView  mv  =  new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return mv;
	}	
	
	@RequestMapping("/ResumeSubmit")
	public ModelAndView resumeSubmit(UserResumeVo userResumeVo, CompanyRecruitVo companyRecruitVo) {
		ModelAndView mv = new ModelAndView();
		System.out.println(userResumeVo);
		System.out.println(companyRecruitVo);
		ApplicaionVo applicationVo = new ApplicaionVo();
		applicationVo.setApplication_status("서류검토중");
		applicationVo.setUser_resume_idx(userResumeVo.getUser_resume_idx());
		applicationVo.setCompany_recruit_idx(companyRecruitVo.getCompany_recruit_idx());
		
		
		
		return mv;
		
	}
	
}
