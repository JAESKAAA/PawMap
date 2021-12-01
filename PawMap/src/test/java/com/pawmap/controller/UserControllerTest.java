package com.pawmap.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.pawmap.VO.UserVO;
import com.pawmap.service.UserService;

class UserControllerTest {
//
//	@Autowired
//	private UserService userService;
//		
//	@Autowired
//	private BCryptPasswordEncoder bCryptPasswordEncoder;
//	
//	@Test
//	void testJoin(UserVO vo) {
//		
//		int i = 3;
//		vo.setUserSeq(i);
//		vo.setUserId("테스트계정");
//		vo.setUserType("N");
//		vo.setRole("ROLE_USER");
//		vo.setUserPassword("1234");
//		vo.setUserName("더미테스트계정");
//		vo.setUserEmail("test@test.com");
//		vo.setUserTelNum("0101234");
//		vo.setAddress("테스트주소");
//		vo.setUserNickname("더미테스트 계정입니다");
//		String rawPassword = vo.getUserPassword();
//		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
//		vo.setUserPassword(encPassword);
//		
//		userService.insertUser(vo);
//	}

}
