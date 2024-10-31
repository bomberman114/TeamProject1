package com.green.company.recruit.mapper;

import java.util.HashMap;
import java.util.List;

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




	


	int getCompanyRecruitCount(CompanyUserVo companyUserVo);


	List<CompanyRecruitVo> selectCompanyRecruitListPaging
							(@Param("company_id") String company_id, 
							 @Param("startRow")   int startRow, 
							 @Param("endRow") int endRow);
	

	 



	void setCompanyRecruitDate(HashMap<String, Object> map);
	

	CompanyRecruitVo getCompanyOneRecruit(int company_recruit_idx);

	void deleteRecruit(int company_recruit_idx);


	HashMap<String, String> getCompanyOneRecruitData(CompanyRecruitVo companyRecruitVo);

	void setCompanyRecruitUpdate(CompanyRecruitVo companyRecruitVo);

	void updateRecruitView(CompanyRecruitVo companyRecruitVo);

	List<CompanyRecruitVo> getRecruitListByViews(CompanyRecruitVo companyRecruitVo);

	Integer getCompanyRecruitId(CompanyRecruitVo companyRecruitVo);

	void deleteCompanyRecruit(int company_recruit_idx);

	List<CompanyRecruitVo> getCompanyRecruitIdxsData(CompanyUserVo companyUserVo);

	void deleteCompanyRecruitUserId(CompanyUserVo companyUserVo);

}
