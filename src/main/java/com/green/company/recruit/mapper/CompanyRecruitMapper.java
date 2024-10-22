package com.green.company.recruit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.recruit.vo.CompanyRecruitVo;

@Mapper
public interface CompanyRecruitMapper {

	List<CompanyRecruitVo> companyRecruitList();

	List<CompanyRecruitVo> searchByKeyword(String keyword);

}
