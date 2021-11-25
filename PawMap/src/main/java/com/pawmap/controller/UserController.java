package com.pawmap.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pawmap.VO.UserVO;
import com.pawmap.configuration.auth.PrincipalDetails;
import com.pawmap.service.UserService;
import com.pawmap.util.CookieUtil;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
		
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
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
	public @ResponseBody String admin() {
		return "admin";
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

	
	//로그인 시 아이디 비밀번호 확인 메소드 
	 //cookieUtil에 setAttribute
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
	

	// 아이디 찾기 화면으로 보내주기 
	@RequestMapping("findLoginId")
	public String showFindLoginId() {
		return "findLoginId";
	}
	// 아이디 찾기 화면에서 데이터 받기 
	@RequestMapping("/doFindLoginId")
	@ResponseBody
	public String doFindLoginId(@RequestParam Map<String, Object> param) {
		Map<String, Object> findLoginIdRs = userService.findLoginId(param);

		return (String) findLoginIdRs.get("msg");
	}
		
	// 비밀번호를 잊어버렸습니까? 클릭시 forgotPW 
	@GetMapping("/forgotPw")
	public String showFindLoginPasswd() {
		return "forgotPw";
	}
	// 비밀번호 찾기 화면에서 데이터 받기 
	@RequestMapping("/doForgotPw")
	@ResponseBody
	public String doFindLoginPasswd(@RequestParam Map<String, Object> param) {
		Map<String, Object> findLoginIdRs = userService.findLoginPasswd(param);
		
		return (String) findLoginIdRs.get("msg");
		
	}
	

}
