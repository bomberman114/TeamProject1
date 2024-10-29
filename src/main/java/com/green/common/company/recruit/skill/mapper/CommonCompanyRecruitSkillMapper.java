package com.green.common.company.recruit.skill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;



import org.apache.ibatis.annotations.Param;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.skills.vo.SkillVo;

@Mapper
public interface CommonCompanyRecruitSkillMapper {



	void setCommonCompanyRecruitSkill(@Param("company_recruit_idx") int company_recruit_idx, @Param("skillList") List<SkillVo> skillList);

	void deletCommonCompanyRecruitSkill(@Param("company_recruit_idx") int company_recruit_idx);





}
