package com.green.company.mapper;

import org.apache.ibatis.annotations.Mapper;

import org.apache.ibatis.annotations.Param;

import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.users.vo.CompanyUserVo;

@Mapper
public interface CompanyMapper {

	CompanyUserVo getCompanyUser(CompanyUserVo companyUserVo);


	CompanyUserVo getInfoUser( @Param ("company_id") String company_id);


	void updateInfoUser(CompanyUserVo companyUserVo);


	CompanyUserVo getCompanyUser(String company_id);




}
