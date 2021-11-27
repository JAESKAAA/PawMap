package com.pawmap.controller;



import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
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
	
	/*
	 * 페이지 이동 관련 메소드
	 * 
	 * */
	//공백 및 / 요청시 메인페이지로 이동
	@GetMapping({"","/"})
	public String index() {
		return "index2";
	}

	
	//관리자 페이지 이동하는 메소드
	@GetMapping("/admin")
	public  String admin() {
		return "admin_index";
	}
	
	//마이페이지 이동하는 메소드
	@GetMapping("/mypage")
	public  String mypageIndex() {
		return "my_page_main";
	}
	//마이페이지-> 회원정보 수정으로 이동하는 메소드
	@GetMapping("/mypage/userInfo")
	public  String userInfo() {
		return "my_account_update";
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
	
	//일반 유저 회원가입으로 이동
	@GetMapping("/userJoinForm")
	public String userJoinForm() {
		return "user-join-form";
	}
	//병원 유저 회원가입으로 이동
	@GetMapping("/hospitalJoinForm")
	public String hospitalJoinForm() {
		return "hospital-join-form";
	}
	
	// 아이디 찾기 화면으로 보내주기 
	@RequestMapping("findLoginId")
	public String showFindLoginId() {
		return "findLoginId";
	}
				
	// 비밀번호를 잊어버렸습니까? 클릭시 forgotPW 
	@GetMapping("/forgotPw")
	public String showFindLoginPasswd() {
		return "forgotPw";
	}
	
	//관리자페이지 -> 회원정보 관리로 이동
	@GetMapping("/admin/userInfo")
	public String userInfoForm() {
		return "admin_user";
	}
	
	
	/*
	 *로직관련 메서드
	 * 
	 * */
	//마이페이지 -> 유저 정보 업데이트
	@PostMapping("/mypage/updateUser")
	public String updateUser(UserVO vo, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		System.out.println("updateUser 호출 !! ");
		System.out.println("principal디테일 getNickname ====="+ principalDetails.getNickname());
		System.out.println("UserVO getNickname ====="+ vo.getUserNickname());
		userService.updateUser(vo);
		
		return "redirect:/";
	}
	
	//마이페이지-> 회원탈퇴 로직 (미완성)
	@GetMapping("/mypage/deleteUser")
	public  String deleteUser(UserVO vo, HttpSession session) {
		System.out.println("deleteUser 호출 !!!");
		session.invalidate();
		userService.deleteUser(vo);
		 
		 return "redirect:/";
	}
	
	
	
	//OAuth 로그인을해도 PrincipalDetails로 받을수 있고, userDetails로 로그인해도 PrincipalDetails로 받을 수 있음
	@GetMapping("/user")
	public @ResponseBody String user(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		System.out.println("principalDetails : "+principalDetails.getUser());
		return "user";
	}
	

	
	@GetMapping("/manager")
	public @ResponseBody String manager() {
		return "manager";
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

	//회원 가입 메소드
	@PostMapping("/join")
	public String join(UserVO vo) {
		System.out.println(vo);
		vo.setRole("ROLE_USER");
		vo.setUserType("N");
		String rawPassword = vo.getUserPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		vo.setUserPassword(encPassword);
		
		System.out.println("vo출력 : "+vo);
		userService.insertUser(vo);
		
		return "redirect:/loginForm";
	}
	//병원 회원 가입 메소드
	@PostMapping("/hospitalJoin")
	public String hospitalJoin(UserVO vo) {
		System.out.println(vo);
		vo.setRole("ROLE_USER");
		vo.setUserType("H");
		String rawPassword = vo.getUserPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		vo.setUserPassword(encPassword);
		userService.insertHospitalUser(vo);
		
		return "redirect:/loginForm";
	}
	
	// 아이디 중복 검사 => 회원 가입 페이지에서 아이디 중복 메세지 안뜸
	@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String userIdChk(String userId) throws Exception{
		int result = userService.idCheck(userId);
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}	

	} // memberIdChkPOST() 종료	
	

	@PreAuthorize("hasRole('ROLE_ADMIN')") //하기 메서드가 실행하기 직전에 실행됨
	@GetMapping("/data")
	public @ResponseBody String data() {

		return "login";
	}
	
	
	// 아이디 찾기 화면에서 데이터 받기 
	@RequestMapping("/doFindLoginId")
	@ResponseBody
	public String doFindLoginId(@RequestParam Map<String, Object> param) {
		Map<String, Object> findLoginIdRs = userService.findLoginId(param);

		return (String) findLoginIdRs.get("msg");
	}
		

	// 비밀번호 찾기 화면에서 데이터 받기 
	@RequestMapping("/doForgotPw")
	@ResponseBody
	public String doFindLoginPasswd(@RequestParam Map<String, Object> param) {
		Map<String, Object> findLoginIdRs = userService.findLoginPasswd(param);
		
		return (String) findLoginIdRs.get("msg");
	}
	
	//일반 유저 목록 표출
	@GetMapping("/getUserList")
	public String getUserList(UserVO vo, Model model) {
		System.out.println("getUserList 호출 !!");
		
		//리스트에 담긴 값 확인용 코드
		List<UserVO> list = userService.getUserList(vo);
		System.out.println("UserList 표출=="+list);
		
		model.addAttribute("userList", userService.getUserList(vo));
		
		return "admin_user";
	}
	
	//특정 유저 정보 출력
	@GetMapping("/getUser")
	public String getUser(UserVO vo, Model model) {
		System.out.println("getUser 호출 !!");
		System.out.println("vo.getSeq() ==== "+ vo.getUserSeq());
		
		UserVO user = userService.getUser(vo);
		System.out.println("user 정보 출력== " + user);
		
		 model.addAttribute("user", userService.getUser(vo));
		
		return "admin_user_detail";
	}
	
	//병원 유저 목록 표출
	@GetMapping("/getHospitalList")
	public String getHospitalList(UserVO vo, Model model) {
		System.out.println("getHospitalList 호출 !!");
		
		//리스트에 담긴 값 확인용 코드
		List<UserVO> list = userService.getHospitalUserList(vo);
		System.out.println("UserList 표출=="+list);
		
		model.addAttribute("userList", userService.getHospitalUserList(vo));
		
		return "admin_user";
		
	}
	//관리자 페이지 -> 유저 정보 업데이트
	@PostMapping("/admin/updateUser")
	public String adminUpdateUser(UserVO vo) {
		System.out.println("Admin updateUser 호출 !! ");
		System.out.println("UserVO getNickname ====="+ vo.getUserId());
		userService.updateUserAdmin(vo);
		
		return "redirect:/admin";
	}
	
	//관리자페이지-> 회원삭제 로직 (미완성)
		@GetMapping("/admin/deleteUser")
		public  String adminDeleteUser(UserVO vo) {
			System.out.println("Admin deleteUser 호출 !!!");
			userService.deleteUser(vo);
			 
			 return "redirect:/admin";
		}

	



}
