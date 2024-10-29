package com.green.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Common")
public class LoginController {
	
	ModelAndView mv = new ModelAndView();
	
	@RequestMapping("/LoginForm")
	public ModelAndView LoginForm() {
		mv.setViewName("/common/loginForm");
		return mv ;
}
	
}
