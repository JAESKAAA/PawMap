package com.pawmap.service;

import com.pawmap.VO.UserVO;

public interface UserService {

	void insertUser(UserVO vo);
	
	UserVO findByUsername(String username);

	void socialJoin(UserVO vo);
	
	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
}
