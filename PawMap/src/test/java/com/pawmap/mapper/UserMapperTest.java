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
		
			vo.setUserId("admin");
			vo.setUserEmail("admin@admin.com");
			vo.setUserName("관리자");
			vo.setUserNickname("관리자테스터");
			vo.setRole("ROLE_ADMIN");
			vo.setUserType("A");
			vo.setUserPassword("admin");
			String rawPassword = vo.getUserPassword();
			String encPassword = bCryptPasswordEncoder.encode(rawPassword);
			vo.setUserPassword(encPassword);
			userService.insertUser(vo);
			count++;
		
		log.info("완료된 숫자 = "+count);
	}

}
