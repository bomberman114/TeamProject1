package com.green.skill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.skills.vo.SkillVo;

@Mapper
public interface SkillMapper {

	List<SkillVo> getSkillList();


}
