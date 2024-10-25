package com.green.company.recruit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import org.apache.ibatis.annotations.Param;

import com.green.company.recruit.vo.CompanyRecruitVo;

import com.green.company.users.vo.CompanyUserVo;


@Mapper
public interface CompanyRecruitMapper {


	List<CompanyRecruitVo> companyRecruitList();

	List<CompanyRecruitVo> searchByKeyword(String keyword);

	List<CompanyRecruitVo> selectCompanyRecruitList(CompanyUserVo companyUserVo);


	HashMap<String, Object> getCompanyRecruit(CompanyRecruitVo companyRecruitVo);

	HashMap<String, Object> getCompanyRecruitAlications(CompanyRecruitVo companyRecruitVo);



	void setCompanyRecruit(CompanyRecruitVo companyRecruitVo);

	int getCompanyRecruitIdx(String company_id);



	int getCompanyRecruitCount(CompanyUserVo companyUserVo);


	List<CompanyRecruitVo> selectCompanyRecruitListPaging
							(@Param("company_id") String company_id, 
							 @Param("startRow")   int startRow, 
							 @Param("endRow") int endRow);
	

	 


	void setCompanyRecruitDate(HashMap<String, Object> map);
	

	CompanyRecruitVo getCompanyOneRecruit(int company_recruit_idx);

	void deleteRecruit(int company_recruit_idx);



}
