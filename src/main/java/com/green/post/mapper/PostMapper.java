package com.green.post.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.post.vo.PostVo;

@Mapper
public interface PostMapper {

	PostVo getPost(PostVo postVo);
	
}
