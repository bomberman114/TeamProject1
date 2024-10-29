package com.green.application.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.applicaions.vo.ApplicaionVo;

@Mapper
public interface ApplicationsMapper {

	void setApplicationData(ApplicaionVo applicationVo);

}
