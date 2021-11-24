package com.pawmap.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.UserVO;
import com.pawmap.mapper.UserMapper;
import com.pawmap.service.UserService;


/*
 * @Controller, @Service, @Repository
 * ��� ������̼ǵ� ��� Bean ��ü �����̶�� ������ ����� ��
 * �ٸ�, ��������� ������ ����� ��Ÿ�� �ֱ� ���� �����ؼ� �����
 * @Controller : Presentation Layer (�� ��û�� ������ ó����)
 * @Service : Service Layer (���ο��� �ڹ� ������ ó����)
 * @Repository : Persistence Layer (DB�� ���ϰ� ���� �ܺ� I/O�۾��� ó����)
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
	 @Override
	public void socialJoin(UserVO vo) {
		userMapper.socialJoin(vo);
	}
	 
	 // 아이디 중복체크
	 @Override
	 public int idCheck(String userId) throws Exception {
		 
		 return userMapper.idCheck(userId);
	 }
}


