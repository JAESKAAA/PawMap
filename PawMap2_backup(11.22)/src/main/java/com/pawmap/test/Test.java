package com.pawmap.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.pawmap.VO.UserVO;
import com.pawmap.service.BoardService;

@Controller
public class Test {

	@Autowired
	private BoardService boardService;
	
	//회원가입(DB연동) 테스트용
	@PostMapping("/join")
	public String join(UserVO vo) {
		System.out.println("Test-> Join 메소드 실행");
		vo.setType("N");
		boardService.insertTest(vo);
		
		return "index";
	}
	
	//index 페이지 테스트용
	@GetMapping("/welcome")
	public String index() {
		return "index2";
	}
}
