package com.pawmap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.pawmap.VO.UserVO;


@Mapper
public interface UserMapper {

	void insertUser(UserVO vo);
	
	 UserVO findByUsername(String username);
}