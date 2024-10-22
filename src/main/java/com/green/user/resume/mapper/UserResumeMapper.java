package com.green.user.resume.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.user.resume.vo.UserResumeVo;

@Mapper
public interface UserResumeMapper {

	void insertUserResume(UserResumeVo userResumeVo);

	List<UserResumeVo> selectUserResumeList(String userid);
	
	

}
