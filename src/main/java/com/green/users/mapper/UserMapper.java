package com.green.users.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.vo.UserVo;

@Mapper
public interface UserMapper {

	void insertUser(UserVo uservo);

	List<UserVo> getUserList();

	void deleteUser(UserVo userVo);

	UserVo getUser(UserVo userVo);

	void updateUser(UserVo userVo);

	UserVo getUserById(String user_id);

	UserVo login(String userid, String passwd);

	

}
