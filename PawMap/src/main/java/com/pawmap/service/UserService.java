package com.pawmap.service;


import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import src.main.java.com.pawmap.VO.UserVO;

@Component
public interface UserService {
	
	void insertUser(UserVO vo);
	
	UserVO findByUsername(String username);

	void socialJoin(UserVO vo);

	
	public UserVO checkDuplicateId(@Param("userId") int userId);

	public Map<String, Object> login(Map<String, Object> args);

	public Map<String, Object> loginV2(Map<String, Object> args);
	
	public Map<String, Object> findLoginId(Map<String, Object> param);

	public Map<String, Object> findLoginPasswd(Map<String, Object> param);

}
