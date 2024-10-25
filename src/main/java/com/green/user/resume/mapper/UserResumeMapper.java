package com.green.user.resume.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.green.user.resume.vo.UserResumeVo;

import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;
import com.green.user.resume.vo.UserResumeVo;
import com.green.users.vo.UserVo;


@Mapper
public interface UserResumeMapper {


	void insertUserResume(UserResumeVo userResumeVo);

	List<UserResumeVo> selectUserResumeList(String userid);
	
	UserResumeVo getUserResume(UserResumeVo userResumeVo);

	void updateUserResume(UserResumeVo userResumeVo);

	void updateUserResumeSkills(UserResumeVo userResumeVo);

	void deleteUserResume(UserResumeVo userResumeVo);

	void deleteUserResumeSkills(UserResumeVo userResumeVo);

	void insertUserSkill(UserResumeVo userResumeVo);

	List<RegionVo> getRegion();


	List<SkillVo> getSkill();


	List<UserResumeVo> getUserResumeList();

}
