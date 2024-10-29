package com.green.region.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.region.vo.RegionVo;

@Mapper
public interface RegeionMapper {




	List<RegionVo> getRegionList();

}
