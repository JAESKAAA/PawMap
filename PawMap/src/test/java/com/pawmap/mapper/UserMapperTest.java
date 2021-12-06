package com.pawmap.mapper;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.pawmap.VO.UserVO;
import com.pawmap.service.UserService;

import lombok.extern.log4j.Log4j2;

@SpringBootTest
@Log4j2
class UserMapperTest {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Test
	@DisplayName("회원가입테스트")
	void joinTest() {
	
		UserVO vo = new UserVO();
		int count=0;
		for(int i=0; i<100; i++) {
			vo.setUserId("병원테스트계정_"+i);
			vo.setUserEmail("test_"+i+"@test.com");
			vo.setUserName("병원테스터_"+i);
			vo.setUserNickname("병원테스터닉네임_"+i);
			vo.setRole("ROLE_USER");
			vo.setUserType("H");
			vo.setUserPassword("1234");
			String rawPassword = vo.getUserPassword();
			String encPassword = bCryptPasswordEncoder.encode(rawPassword);
			vo.setUserPassword(encPassword);
			userService.insertUser(vo);
			count++;
		}
		log.info("완료된 숫자 = "+count);
	}

}
