package com.pawmap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pawmap.VO.UserVO;
import com.pawmap.configuration.auth.PrincipalDetails;
import com.pawmap.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/test/login")
	public @ResponseBody String loginTest(
			Authentication authentication,
			//@AuthenticationPrincipal : ������̼��� ���� ���������� ���ٰ���
			//PrincipalDetails�� UserDetails�� ����Ŭ�����̹Ƿ� �ش� Ŭ������ �� �� ����
			@AuthenticationPrincipal PrincipalDetails userDetails) { //DI(������ ����)
		System.out.println("/test/login======================");
		PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal();
		System.out.println("authentication : " + principalDetails.getUser());
		
		System.out.println("userDetails : "+userDetails.getUser());
		return "���� ���� Ȯ���ϱ�";
	}
	
	@GetMapping("/test/oauth/login")
	public @ResponseBody String testOAuthlogin(
			Authentication authentication,
			@AuthenticationPrincipal OAuth2User oauth) {
		System.out.println("/test/oauth/login======================");
		OAuth2User oauth2User = (OAuth2User)authentication.getPrincipal();
		System.out.println("authentication : " + oauth2User.getAttributes());
		
		System.out.println("oauth2User : " + oauth.getAttributes());
		
		return "OAuth ���� ���� Ȯ���ϱ�";
	}
	
	
	@GetMapping({"","/"})
	public String index() {
		return "index2";
	}
	
	
	//OAuth �α������ص� PrincipalDetails�� ������ �ְ�, userDetails�� �α����ص� PrincipalDetails�� ���� �� ����
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
	
	//������ ��ť��Ƽ�� �ش� �ּҸ� ����ä�� ���� ���� �ʿ�
	//SecurityConfig���� ���� �� Ȱ��ȭ�ȵ� (������ ���Ͱ� ����ä�⶧��)
	@GetMapping("/loginForm")
	public String loginForm() {
		return "login-form";
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
	
	@PreAuthorize("hasRole('ROLE_ADMIN')") //�ϱ� �޼��尡 �����ϱ� ������ �����
	@GetMapping("/data")
	public @ResponseBody String data() {
		return "��������";
	}
	

}
