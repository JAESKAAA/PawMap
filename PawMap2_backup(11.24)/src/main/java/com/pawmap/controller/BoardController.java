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
		System.out.println("게시판 작성 양식 부르기...");
		return"board-free-form_결";
	}
	
	@PostMapping(value="/board/insertBoard")
	public String insertBoard(BoardVO vo /*, HttpServletRequest request*/ /*,MultipartHttpServletRequest mhsr*/ ) throws IOException {
		System.out.println("글 등록 처리");
		System.out.println(vo); // this line shows if the Client sent the value objects  
//		int boardSeq = boardService.getBoardSeq();
		
		boardService.insertBoard(vo);
		
		return"redirect:board-free-form_결";
	}
	
}
