package com.green.company.users.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.company.users.vo.CompanyUserVo;

@Mapper
public interface CompanyUserMapper {


	List<CompanyUserVo> getCompanyUserList();


	CompanyUserVo getCompanyUser(CompanyUserVo companyUserVo);

	void updateCompanyUser(CompanyUserVo companyUserVo);


	CompanyUserVo getCompanyUserById(String company_id);

	CompanyUserVo login(String company_id, String company_passwd);

	void insertCompanyUser(CompanyUserVo companyUserVo);


	void deleteCompanyUser(CompanyUserVo companyUserVo);

}
