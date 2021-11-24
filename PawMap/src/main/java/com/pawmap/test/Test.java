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
	
	
	@PostMapping("/join")
	public String join(UserVO vo) {
		vo.setType("N");
		boardService.insertTest(vo);
		System.out.println("조인");
		return "index";
	}
	
	
	@GetMapping("/welcome")
	public String index() {
		return "index2";
	}
}
