package com.green.post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.post.mapper.PostMapper;
import com.green.post.vo.PostVo;

@Controller
@RequestMapping("/Post")
public class PostController {
	
	ModelAndView mv = new ModelAndView();
	
	@Autowired
	private PostMapper postMapper;
	
	@RequestMapping("/PostHome")
	public ModelAndView postHome (PostVo postVo) {
		
			mv.setViewName("/post/posthome");
			return mv;
	}
	
	@RequestMapping("/AddPost")
	public ModelAndView addPost (PostVo postVo) {
		
		mv.setViewName("/post/addpost");
		return mv;
	}
	
	@RequestMapping("/PostList")
	public ModelAndView postList (PostVo postVo) {
		
		mv.setViewName("/post/postlist");
		return mv;
	}
	
	@RequestMapping("/submitPost")
	public ModelAndView submitPost (PostVo postVo) {
		
		mv.setViewName("/post/submitpost");
		return mv;
	}
}