package com.green.user.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.user.resume.mapper.UserResumeMapper;
import com.green.user.resume.vo.UserResumeVo;

@Controller
@RequestMapping("/User")
public class UserController {

	ModelAndView mv= new ModelAndView();
	
	@Autowired
	private UserResumeMapper userResumeMapper;
	
	@RequestMapping("/ResumeList")
	public ModelAndView list () {
		System.out.println("왔다");
		String userid = "user01";
		List<UserResumeVo> userResumeList = userResumeMapper.selectUserResumeList(userid);
		System.out.println(userResumeList);
		return mv;
	}
	
	
	@RequestMapping("/RegisterForm")
	public ModelAndView registerForm (String userid) {
		
		
		
		return mv;
	}
	
	@RequestMapping("/Register")
	public ModelAndView register (UserResumeVo userResumeVo) {
		userResumeMapper.insertUserResume(userResumeVo);
		
		
		return mv;
	}
	
	
}
