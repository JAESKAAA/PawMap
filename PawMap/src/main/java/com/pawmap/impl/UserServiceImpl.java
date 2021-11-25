package com.pawmap.impl;

import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.groovy.util.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pawmap.PawMap1124Application;
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
	public Map<String, Object> findLoginId(Map<String, Object> param) {
		String userName = (String) param.get("userName");
		String userEmail = (String) param.get("userEmail");

		UserVO user  = userMapper.searchId(userName, userEmail);

		if (user == null) {
			return Maps.of("resultCode", "F-1", "msg", "일치하는 회원이 없습니다.");
		}

		return Maps.of("resultCode", "S-1", "msg", "당신의 로그인 아이디는 " + user.getUserId() + " 입니다.");

	}
	
	
	
	@Override
	public Map<String, Object> findLoginPasswd(Map<String, Object> param) {
		String userId = (String) param.get("userId");
		String userName = (String) param.get("userName");
		String userEmail = (String) param.get("userEmail");

		UserVO user  = userMapper.searchPwd(userId, userName, userEmail);

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

		//memberDao.updateLoginPasswd(member.getId(), tempLoginPasswd);
		
		/*
		Member a = new Member();
		a.setId(1);
		a.setName("배고파");
		memberDao.update(a);
		*/
		
		String mailTitle = userName + "님, 당신의 계정(" + userId + ")의 임시 패스워드 입니다.";
		String mailBody = "임시 패스워드 : " + tempLoginPasswd;
		mailService.send(userEmail, mailTitle, mailBody);

//		System.out.println(userId);
		
		
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
	
	
//	@RequestMapping(value = "/secuTest", method = RequestMethod.GET)
//    public void secuTest() {
//		String rawPassword = "vam123";                //인코딩 전 메서드
//        String encdoePassword1;                        // 인코딩된 메서드
//        String encdoePassword2;                        // 똑같은 비밀번호 데이터를 encdoe()메서드를 사용했을 때 동일한 인코딩된 값이 나오는지 확인하기 위해 추가
//        
//        encdoePassword1 = passwordEncoder.encode(rawPassword);
//        encdoePassword2 = passwordEncoder.encode(rawPassword);
//        
//        // 인코딩된 패스워드 출력
//        System.out.println("encdoePassword1 : " +encdoePassword1);
//        System.out.println(" encdoePassword2 : " + encdoePassword2);
//        
//        String truePassowrd = "vam123";
//        String falsePassword = "asdfjlasf";
//        
//        System.out.println("truePassword verify : " + passwordEncoder.matches(truePassowrd, encdoePassword1));
//        System.out.println("falsePassword verify : " + passwordEncoder.matches(falsePassword, encdoePassword1));  
//        
//    }
	
	@Override
	public UserVO checkDuplicateId(int userId) {
		return userMapper.checkDuplicateId(userId);
	}
}

