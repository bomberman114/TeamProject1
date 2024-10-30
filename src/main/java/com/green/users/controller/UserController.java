package com.green.users.controller;


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

import com.green.users.mapper.UserMapper;
import com.green.users.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users")
public class UserController {

   
   @Autowired
   private  UserMapper  userMapper;
   
   // 개인회원 추가
   // /Users/RegisterForm
   @RequestMapping( "/RegisterForm" )
   public ModelAndView registerForm() {   
      ModelAndView mv = new ModelAndView();
      mv.setViewName( "users/registerform" );
      return  mv;
   }
   
   // 아이디 중복 체크
   @RequestMapping( "/CheckDuplication" )
   @ResponseBody
   public String checkDuplication( @RequestParam( "user_id" ) String user_id ) {
       UserVo user = userMapper.getUserById(user_id);
       if (user == null) {
           return "가능";  // 아이디가 존재하지 않으면 가능
       }
       return "불가능";  // 아이디가 존재하면 불가능
   }

   @RequestMapping("/Register")
   public  ModelAndView  register( UserVo userVo) {
      userMapper.insertUser( userVo );
      ModelAndView  mv  =  new ModelAndView();
      mv.setViewName("redirect:/Users/List");
      return  mv;
   }
   
   // 회원 삭제
   @RequestMapping( "/Delete" )
   public  ModelAndView delete( UserVo userVo ) {
      userMapper.deleteUser( userVo );
      ModelAndView  mv  =  new ModelAndView();
      mv.setViewName("redirect:/");
      return mv;
   }
   
   // 회원정보 수정
   // 비밀번호 확인 후 수정 페이지로 이동
     @RequestMapping( "/CheckPassword" )
     public ModelAndView checkPassword(
           @RequestParam( "user_id" ) String user_id,
           @RequestParam( value = "inputPassword", required = false ) String inputPassword ) {
       UserVo user = userMapper.getUserById( user_id );
       ModelAndView mv = new ModelAndView();
       
       
       // 입력된 비밀번호가 null이거나 비어있는 경우
       if (inputPassword == null || inputPassword.isEmpty()) {
           mv.setViewName( "users/checkPassword" );
           return mv;
       }
       // 입력된 비밀번호와 DB의 비밀번호를 비교
       if (user.getUser_passwd().equals(inputPassword)) {
           // 비밀번호가 일치하면 수정 페이지로 이동
           mv.setViewName( "redirect:/Users/UpdateForm?user_id=" + user_id );
       } else {
           // 비밀번호가 틀리면 오류 메시지와 함께 비밀번호 확인 페이지로 다시 이동
           mv.setViewName( "users/checkPassword" );
           mv.addObject( "error", "비밀번호가 일치하지 않습니다." );
       }
       return mv;
     }

   @RequestMapping( "/UpdateForm" )
   public  ModelAndView  updateForm( UserVo userVo ) {
      UserVo  user =  userMapper.getUser( userVo );
      ModelAndView  mv  =  new ModelAndView();
      mv.setViewName( "users/updateform" );
      mv.addObject( "user", user );
      return        mv;
   }
   
   // /Users/Update
   @RequestMapping( "/Update" )
   public  ModelAndView  update( UserVo userVo, @RequestParam( "user_id" ) String user_id ) {
      userMapper.updateUser( userVo );
      ModelAndView mv = new ModelAndView();
      mv.setViewName( "redirect:/Users/View?user_id=" + user_id );
      return        mv;
   }

   // 개인정보 보기
   @RequestMapping( "/View" )
   public ModelAndView view( UserVo userVo ) {
      UserVo user = userMapper.getUser( userVo );
      ModelAndView  mv  =  new ModelAndView();
      mv.addObject( "user", user );
      mv.setViewName( "users/view" );
      return mv;
   }
   
   //-------------------------------------------------------------------
   // Login
   @GetMapping( "/LoginForm" )
   public  String  loginForm(
         @RequestParam( value = "uri", required = false ) String uri, Model model ) {
      model.addAttribute("uri", uri);
      //model.addAttribute("nowpage", nowpage);
      return "users/loginform";
   }
   
   // /Users/Login
   @PostMapping( "/Login" )
   public String login(
      HttpServletRequest   request,
      HttpServletResponse  response
      ) {
      String userid  = request.getParameter( "user_id" );
      String passwd  = request.getParameter( "user_passwd" );
      
      UserVo userVo = userMapper.login( userid, passwd );
         
      HttpSession  session = request.getSession();
      session.setAttribute( "userLogin", userVo );

      session.setMaxInactiveInterval(60*60);
      return  "redirect:/";
      
   }


    // /Users/Logout
    @RequestMapping(value="/Logout", method = RequestMethod.GET)
    public String logout( HttpSession session ) {
        session.invalidate(); // 세션 무효화
        return "redirect:/";
    }
   
   
}








