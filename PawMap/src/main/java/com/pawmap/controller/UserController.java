package com.pawmap.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pawmap.VO.UserVO;
import com.pawmap.configuration.auth.PrincipalDetails;
import com.pawmap.mapper.UserMapper;
import com.pawmap.service.UserService;
import com.pawmap.util.CookieUtil;





@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	 @Autowired 
	 private UserMapper userMapper;
	

	@GetMapping("/test/login")
	public @ResponseBody String loginTest(
			Authentication authentication,
			//@AuthenticationPrincipal : 어노테이션을 통해 세션정보에 접근가능
			//PrincipalDetails는 UserDetails의 구현클래스이므로 해당 클래스로 쓸 수 있음
			@AuthenticationPrincipal PrincipalDetails userDetails) { //DI(의존성 주입)
		System.out.println("/test/login======================");
		PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal();
		System.out.println("authentication : " + principalDetails.getUser());
		
		System.out.println("userDetails : "+userDetails.getUser());
		return "세션 정보 확인하기";
	}
	
	@GetMapping("/test/oauth/login")
	public @ResponseBody String testOAuthlogin(
			Authentication authentication,
			@AuthenticationPrincipal OAuth2User oauth) {
		System.out.println("/test/oauth/login======================");
		OAuth2User oauth2User = (OAuth2User)authentication.getPrincipal();
		System.out.println("authentication : " + oauth2User.getAttributes());
		
		System.out.println("oauth2User : " + oauth.getAttributes());
		
		return "OAuth 세션 정보 확인하기";
	}
	
	
	@GetMapping({"","/"})
	public String index() {
		return "index2";
	}

	
	
	//OAuth 로그인을해도 PrincipalDetails로 받을수 있고, userDetails로 로그인해도 PrincipalDetails로 받을 수 있음
	@GetMapping("/user")
	public @ResponseBody String user(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		System.out.println("principalDetails : "+principalDetails.getUser());
		return "user";
	}
	
	@GetMapping("/admin")
	public  String admin() {
		return "admin_index";
	}
	
	@GetMapping("/manager")
	public @ResponseBody String manager() {
		return "manager";
	}
	
	//스프링 시큐리티가 해당 주소를 낚아채감 추후 설정 필요
	//SecurityConfig파일 생성 후 활성화안됨 (스프링 필터가 가로채기때문)
	@GetMapping("/loginForm")
	public String loginForm() {
		return "login-form";
	}

		
	
	 @RequestMapping("/doLogin")
	 @ResponseBody
	 public String doLogin(HttpServletResponse response, @RequestParam Map<String, Object> param) {
		 Map<String, Object> rs = userService.loginV2(param);
 
		 String resultCode = (String) rs.get("resultCode");
		 UserVO userId = (UserVO) rs.get("User");
 
		 if (resultCode.startsWith("S-")) {
			 CookieUtil.setAttribute(response, "uerId", userId.getUserId() + "");
		 }
 
		 return (String) rs.get("msg");
		 
	 }

	@GetMapping("/joinForm")
	public String joinForm() {
		return "join-form";
	}
	@GetMapping("/userJoinForm")
	public String userJoinForm() {
		return "user-join-form";
	}
	
	@PostMapping("/join")
	public String join(UserVO vo) {
		System.out.println(vo);
		vo.setRole("ROLE_USER");
		String rawPassword = vo.getUserPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		vo.setUserPassword(encPassword);
		userService.insertUser(vo);
		
		return "redirect:/loginForm";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')") //하기 메서드가 실행하기 직전에 실행됨
	@GetMapping("/data")
	public @ResponseBody String data() {

		return "login";
	}
	

	// 아이디 찾기

			@RequestMapping(value = "/pawmap/searchIdPw", method = RequestMethod.POST)
			@ResponseBody
			public String searchId(@RequestParam("userName") String userName, 
				@RequestParam("userTelNum") String userTelNum) {
				System.out.println("사용자 전화번호 : "+userTelNum);
				String result = userMapper.searchId(userName, userTelNum);
			    System.out.println("결과: "+result);
			
			
			
				return result;
			}
			

		
	// 비밀번호를 잊어버렸습니까? 클릭시 forgotPW 
	@GetMapping("/searchIdPw")
	public String showFindLoginPasswd() {
		return "searchIdPw";
	}
	// 비밀번호 찾기 화면에서 데이터 받기 

		@RequestMapping("/searchPw")

		@ResponseBody
		public String doFindLoginPasswd(@RequestParam Map<String, Object> param , HttpServletResponse response) throws IOException {
//			String msg= (String) findLoginIdRs.get("msg");
			
			
			String userId = (String) param.get("userId");
			String userName = (String) param.get("userName");
			String userEmail = (String) param.get("userEmail");
			
			UserVO user  = userMapper.searchPwd(userId, userName);
//			UserVO userWrongEmail = 
//					(user.getUserId() ==(String) param.get("userId"))
//					&& (user.getUserEmail() != (String) param.get("userEmail"));
			
			// 입력한 아이디 정보는 회원과 일치하지만 이메일정보는 일치하지 않을 때
				
			if (!user.getUserEmail().equals(userEmail)){
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>alert('이메일 정보가 일치하지 않습니다'); location.href='loginForm';</script>");
				
				out.flush();
			
			} else if(user == null) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				// 입력한 정보가 일치하지 않을 때
				out.println("<script>alert('일치하는 회원이 없습니다'); location.href='loginForm';</script>");
				
				out.flush();
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				// 입력한 정보와 회원정보가 일치할 때 
				out.println("<script>alert('입력하신 메일로 임시 패스워드가 발송되었습니다'); location.href='loginForm';</script>");
				
				out.flush();
				Map<String, Object> findLoginIdRs = userService.findLoginPasswd(param);
			
			}
			 
			return "loginForm";
			
		}


}
