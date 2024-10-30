package com.green.service.center.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.application.mapper.ApplicationsMapper;
import com.green.user.resume.mapper.UserResumeMapper;
import com.green.users.mapper.UserMapper;

@Controller
@RequestMapping( "/Board" )
public class ServiceCenterController {

	ModelAndView mv = new ModelAndView();
	
	@Autowired
	private UserResumeMapper userResumeMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private ApplicationsMapper applicationsMapper;
	

    @RequestMapping( "/Table" )
    public String serarchAddress() {
        return "/users/resume/popupaddress";
    }

	
}
