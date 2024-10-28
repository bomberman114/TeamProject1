package com.green.company.recruit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.company.recruit.vo.CompanyRecruitVo;

import com.green.company.users.vo.CompanyUserVo;
import com.green.region.vo.RegionVo;
import com.green.skills.vo.SkillVo;


@Mapper
public interface CompanyRecruitMapper {


	List<CompanyRecruitVo> companyRecruitList();

	List<CompanyRecruitVo> searchByKeyword(String keyword);

	List<CompanyRecruitVo> selectCompanyRecruitList(CompanyUserVo companyUserVo);


	HashMap<String, Object> getCompanyRecruit(CompanyRecruitVo companyRecruitVo);

	HashMap<String, Object> getCompanyRecruitAlications(CompanyRecruitVo companyRecruitVo);

	void setCompanyRecruit(CompanyRecruitVo companyRecruitVo);

	int getCompanyRecruitIdx(String company_id);

	List<HashMap<String, String>> getCompanyRecruitList(@Param("recruit_title") String recruit_title, 
			@Param("skillListCheck") List<SkillVo> skillListCheck,
			@Param("regionListCheck")List<RegionVo> regionListCheck,
			@Param("startRow") int startRow, 
			@Param("endRow") int endRow );

	int getCompanyRecruitListCount(@Param("recruit_title")  String recruit_title,
								   @Param("skillListCheck") List<SkillVo> skillListCheck, 
								   @Param("regionListCheck")List<RegionVo> regionListCheck);




	






}
