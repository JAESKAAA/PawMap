package com.pawmap.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.pawmap.VO.UserVO;

@Component
public interface UserService {
	
	void insertUser(UserVO vo);
	//병원 회원 가입
	void insertHospitalUser(UserVO vo);
	
	UserVO findByUsername(String username);

	void socialJoin(UserVO vo);

	// 아이디 중복 검사
	public int idCheck(String userId) throws Exception;

	public UserVO checkDuplicateId(@Param("userId") int userId);
	

	public Map<String, Object> login(Map<String, Object> args);

	public Map<String, Object> loginV2(Map<String, Object> args);
	
	String searchId(@Param("userName")String userName, @Param("userTelNum")String userTelNum);


	public Map<String, Object> findLoginPasswd(Map<String, Object> param);



	//회원정보 수정 메서드
	public void updateUser(UserVO vo);
	
	//회원정보 삭제 메서드
	public void deleteUser(UserVO vo);

	//일반 유저 리스트 가져오는 메서드
	public List<UserVO> getUserList(UserVO vo);
	//병원 유저 리스트 가져오는 메서드
	public List<UserVO> getHospitalUserList(UserVO vo);
	
	//특정 유저 정보 가져오는 메서드
	public UserVO getUser(UserVO vo);
	
	//관리자 페이지 수정 메서드
	public void updateUserAdmin(UserVO vo);


}
