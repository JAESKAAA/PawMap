package com.pawmap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.pawmap.VO.UserVO;


@Mapper
public interface UserMapper {

	void insertUser(UserVO vo);
	
	 UserVO findByUsername(String username);
	 
	void socialJoin(UserVO vo);
	
	// 아이디 중복 검사
	public int idCheck(String userId);

}