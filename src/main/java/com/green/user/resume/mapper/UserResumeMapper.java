package com.green.user.resume.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;
import com.green.user.resume.vo.UserResumeVo;
import com.green.users.vo.UserVo;


@Mapper
public interface UserResumeMapper {

	List<UserResumeVo> getUserResumeList( @Param( "user_id" ) String user_id );

	List<SkillVo> getSkill();

	List<RegionVo> getRegion();

	void insertUserResume( UserResumeVo userResumeVo );

	void insertUserSkill( @Param( "user_resume_idx" ) int user_resume_idx, @Param( "skillList" ) List<SkillVo> skillList );

	UserResumeVo getUserResume( UserResumeVo userResumeVo );


	void deleteUserResume( UserResumeVo userResumeVo );

	void deleteUserResumeSkills( UserResumeVo userResumeVo );

	int getUserResumeIdx( @Param( "user_id" ) String user_id );


	List<SkillVo> getSelectedSkills( @Param("user_resume_idx") int user_resume_idx);

	void updateUserResume(UserResumeVo userResumeVo);

	List<UserResumeVo> getUserResumeListData(UserVo userVo);

	List<UserResumeVo> getResumeIdx(UserVo userVo);


	int getRecruitResumeListCount(CompanyRecruitVo companyRecruitVo);

	List<HashMap<String, String>> getRecruitResumeList(@Param("company_recruit_idx") int company_recruit_idx,@Param("startRow") int startRow,@Param("endRow") int endRow);


	HashMap<String, String> getUserResumeMap(UserResumeVo userResumeVo, CompanyRecruitVo companyRecruitVo);

	HashMap<String, String> getUserResumeMap(@Param("user_resume_idx") int user_resume_idx,@Param("company_recruit_idx") int company_recruit_idx);





}
