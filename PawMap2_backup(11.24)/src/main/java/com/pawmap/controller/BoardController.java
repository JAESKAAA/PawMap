package com.pawmap.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.pawmap.VO.BoardVO;
import com.pawmap.service.BoardService;

@Controller
//@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping(value="/board/insertBoard")
	public String insertBoardView() {
		System.out.println("�Խ��� �ۼ� ��� �θ���...");
		return"board-free-form_��";
	}
	
	@PostMapping(value="/board/insertBoard")
	public String insertBoard(BoardVO vo /*, HttpServletRequest request*/ /*,MultipartHttpServletRequest mhsr*/ ) throws IOException {
		System.out.println("�� ��� ó��");
		System.out.println(vo); // this line shows if the Client sent the value objects  
//		int boardSeq = boardService.getBoardSeq();
		
		boardService.insertBoard(vo);
		
		return"redirect:board-free-form_��";
	}
	
}
