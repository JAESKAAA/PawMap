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
	
	//ȸ������(DB����) �׽�Ʈ��
	@PostMapping("/join")
	public String join(UserVO vo) {
		System.out.println("Test-> Join �޼ҵ� ����");
		vo.setType("N");
		boardService.insertTest(vo);
		
		return "index";
	}
	
	//index ������ �׽�Ʈ��
	@GetMapping("/welcome")
	public String index() {
		return "index2";
	}
}
