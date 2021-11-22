package com.pawmap.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.UserVO;
import com.pawmap.mapper.UserMapper;
import com.pawmap.service.BoardService;
import com.pawmap.service.UserService;


/*
 * @Controller, @Service, @Repository
 * 상기 어노테이션들 모두 Bean 객체 생성이라는 동일한 기능을 함
 * 다만, 명시적으로 각각의 기능을 나타내 주기 위해 구분해서 사용함
 * @Controller : Presentation Layer (웹 요청과 응답을 처리함)
 * @Service : Service Layer (내부에서 자바 로직을 처리함)
 * @Repository : Persistence Layer (DB나 파일과 같은 외부 I/O작업을 처리함)
 * */
@Service
public class UserServiceImpl implements UserService{

	
	 @Autowired 
	 private UserMapper userMapper;
	 
	@Override
	public void insertUser(UserVO vo) {
		userMapper.insertUser(vo);
}
	 @Override
	public UserVO findByUsername(String username) {
		return userMapper.findByUsername(username);
	}
}

