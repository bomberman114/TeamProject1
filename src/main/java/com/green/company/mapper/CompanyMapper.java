package com.green.company.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.users.vo.CompanyUserVo;

@Mapper
public interface CompanyMapper {

	CompanyUserVo getCompanyUser(CompanyUserVo companyUserVo);

}
