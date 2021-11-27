package com.pawmap.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.UserVO;


@Mapper
public interface UserMapper {

	void insertUser(UserVO vo);
	
	 UserVO findByUsername(String username);
	 
	void socialJoin(UserVO vo);

	public UserVO findByLoginId(@Param("userId") String userId);

	public UserVO checkDuplicateId(@Param("id") int userId);
	
	UserVO checkIdPwd(String userId, String userPasswd);

	public UserVO searchPwd(@Param("userId")String userId, @Param("userName")String userName);


	String searchId(@Param("userName")String userName, @Param("userTelNum")String userTelNum);


	public void changePwd(@Param("userId")int userId, @Param("userPassword")String userPasswd);
	
	public void update(UserVO vo);



}