package com.pawmap.service;

import com.pawmap.VO.UserVO;

public interface UserService {

	void insertUser(UserVO vo);
	
	UserVO findByUsername(String username);
}
