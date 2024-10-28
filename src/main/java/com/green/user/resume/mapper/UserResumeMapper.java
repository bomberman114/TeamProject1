package com.green.user.resume.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;
import com.green.user.resume.vo.UserResumeVo;


@Mapper
public interface UserResumeMapper {

	List<UserResumeVo> getUserResumeList( String user_id );

	List<SkillVo> getSkill();

	List<RegionVo> getRegion();

	void insertUserResume( UserResumeVo userResumeVo );

	void insertUserSkill( @Param( "user_resume_idx" ) int user_resume_idx, @Param( "skillList" ) List<SkillVo> skillList );

	UserResumeVo getUserResume( UserResumeVo userResumeVo );

	void updateUserResume( UserResumeVo userResumeVo );

	void updateUserResumeSkills( UserResumeVo userResumeVo );

	void deleteUserResume( UserResumeVo userResumeVo );

	void deleteUserResumeSkills( UserResumeVo userResumeVo );

	int getUserResumeIdx( String user_id );


	List<SkillVo> getSelectedSkills(int user_resume_idx);




}
