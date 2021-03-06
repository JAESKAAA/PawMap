package com.pawmap.impl;


import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.groovy.util.Maps;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pawmap.VO.UserVO;
import com.pawmap.mapper.UserMapper;
import com.pawmap.service.MailService;
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
	
	 @Autowired
	 MailService mailService;
	 
	 @Autowired
	 BCryptPasswordEncoder passwordEncoder;
	 
	 @Autowired
	 private SqlSessionTemplate sqlSession;
 
	@Override
	public void insertUser(UserVO vo) {
		userMapper.insertUser(vo);
}
	@Override
	public void insertHospitalUser(UserVO vo) {
	userMapper.insertHospitalUser(vo);
	}
	
	@Override
	public void insertHospitalData(UserVO vo) {
		userMapper.insertHospitalData(vo);
	}
	
	 @Override
	public UserVO findByUsername(String username) {
		return userMapper.findByUsername(username);
	}
	 @Override
	public void socialJoin(UserVO vo) {
		userMapper.socialJoin(vo);
	}

	 
	 // 아이디 중복 체크
	@Override
	public int idCheck(String id) throws Exception {
		return userMapper.idCheck(id);
	}
	
	 // 닉네임 중복 체크
	@Override
	public int nickCheck(String nickname) throws Exception {
		return userMapper.nickCheck(nickname);
	}
	
	 // 이메일 중복 체크
	@Override
	public int emailCheck(String email) throws Exception {
		return userMapper.emailCheck(email);
	}
	
	// 사업자등록번호 중복 체크
	@Override
	public int comCheck(String comnum) throws Exception {
		return userMapper.comCheck(comnum);
	}	

	
	@Override
	public Map<String, Object> login(Map<String, Object> args) {
		Map<String, Object> rs = new HashMap<>();

		String userId = (String) args.get("userId");
		String userPassword = (String) args.get("userPassword");

		UserVO user  = userMapper.findByLoginId(userId);

		if (user == null) {
			rs.put("resultCode", "F-1");
			rs.put("msg", "일치하는 회원이 없습니다.");

			return rs;
		} else if (user.getUserPassword().equals(userPassword) == false){
			rs.put("resultCode", "F-2");
			rs.put("msg", "비밀번호가 일치하지 않습니다.");

			return rs;
		}

		rs.put("resultCode", "S-1");
		rs.put("msg", user.getUserName() + "님 환영합니다.");
		rs.put("user", user);

		return rs;
	}
	@Override
	public Map<String, Object> loginV2(Map<String, Object> args) {
		Map<String, Object> rs = new HashMap<>();

		String userId = (String) args.get("userId");
		String userPasswd = (String) args.get("userPasswd");

		UserVO user  = userMapper.checkIdPwd(userId, userPasswd);

		if (user == null) {
			rs.put("resultCode", "F-1");
			rs.put("msg", "일치하는 회원이 없습니다.");

			return rs;
		}

		rs.put("resultCode", "S-1");
		rs.put("msg", user.getUserName() + "님 환영합니다.");
		rs.put("member", user);

		return rs;
	}

	@Override
	public Map<String, Object> findLoginPasswd(Map<String, Object> param) {
		String userId = (String) param.get("userId");
		String userName = (String) param.get("userName");
		String userEmail = (String) param.get("userEmail");
		UserVO user  = userMapper.searchPwd(userId, userName);

		if (user == null) {
			return Maps.of("resultCode", "F-1", "msg", "일치하는 회원이 없습니다.");
		}
		
		char[] charSet = new char[] 
				{ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
				 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 
				'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 
				'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 
				's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!', '@', '#', 
				'$', '%', '^', '&' }; 
		
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom(); 
		sr.setSeed(new Date().getTime()); 
		int idx = 0; int len = charSet.length; 
		for (int i=0; i<10; i++) { 
			idx = sr.nextInt(len); // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다. 
			sb.append(charSet[idx]); 
		}

		String tempLoginPasswd = sb.toString();
				
		user.setUserPassword(tempLoginPasswd);
		
		String mailTitle = userName + "님, 당신의 계정(" + userId + ")의 임시 패스워드 입니다.";
		String mailBody = "임시 패스워드 : " + tempLoginPasswd;
		mailService.send(userEmail, mailTitle, mailBody);


		// 비밀번호 암호화해주는 메서드
		tempLoginPasswd = passwordEncoder.encode(tempLoginPasswd);
		//tempLoginPasswd = PawMap1124Application.encodePwd(tempLoginPasswd);
		// 데이터 베이스 값은 암호한 값으로 저장시킨다.
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setUserPassword(tempLoginPasswd);
		userMapper.update(vo);
		

		return Maps.of("resultCode", "S-1", "msg", "입력하신 메일로 임시 패스워드가 발송되었습니다.");
		
	}
	
	@Override
	public UserVO checkDuplicateId(int userId) {
		return userMapper.checkDuplicateId(userId);
	}


	
	@Override
	public void updateUser(UserVO vo) {
		userMapper.updateUser(vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		userMapper.deleteUser(vo);
	}
	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userMapper.getUserList(vo);
	}
	@Override
	public List<UserVO> getHospitalUserList(UserVO vo) {
		return userMapper.getHospitalUserList(vo);
	}
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userMapper.getUser(vo);
	}
	
	@Override
	public void updateUserAdmin(UserVO vo) {
		userMapper.updateUserAdmin(vo);
	}
	@Override
	public String searchId(String userName, String userTelNum) {
		userMapper = sqlSession.getMapper(UserMapper.class);
		System.out.println(userName + userTelNum);

		String result = "";
		System.out.println(result);

		try {
			result = userMapper.searchId(userName, userTelNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public void updateUserProfileNull(int userSeq, String userType, String userId) {
		userMapper.updateUserProfileNull(userSeq,userType,userId);
	}


}
