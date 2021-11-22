package com.pawmap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pawmap.VO.UserVO;
import com.pawmap.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping({"","/"})
	public String index() {
		return "index2";
	}
	
	@GetMapping("/user")
	public @ResponseBody String user() {
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
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/info")
	public @ResponseBody String info() {
		return "개인정보";
	}
	

}
