package com.pawmap.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pawmap.VO.BoardVO;
import com.pawmap.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	
	@GetMapping("/board/form")
	public String getBoardForm() {		
		return "board-free-form_결";
	}
	
	@PostMapping("/board/form")
	public String getBoardFormm(BoardVO vo) {


		System.out.println("boardController탔음");
		System.out.println("==================================="+vo.getBoardType());
		boardService.insertContent(vo);
		
		//화면 네비게이션(게시글 등록 완료 후 게시글 목록으로 이동)
		return "redirect:getBoardList";
	}
	
	
	
//	**** 글 수정
	//ModelAttribute로 세션에 board라는 이름으로 저장된 객체가 있는지 찾아서 Command객체에 담아줌
	@RequestMapping(value="/updateBoard")
	public String updateBoard(@ModelAttribute("board") BoardVO vo, HttpServletRequest request
				) throws IOException {
//		MultipartHttpServletRequest mhsr <- 파일업로드관련
		System.out.println("글 수정 처리");
		System.out.println("일련번호 : " + vo.getBoardSeq());
		System.out.println("제목 : " + vo.getTitle());
		System.out.println("작성자 이름 : " + vo.getUserId());
		System.out.println("내용 : " + vo.getContent());
		System.out.println("등록일 : " + vo.getRegDate());
//		System.out.println("조회수 : " + vo.getCnt()); 조회수 안씀
		
		
//		파일업로드부분
//		int seq = vo.getBoardSeq();
//		
//		FileUtils fileUtils = new FileUtils();
//		List<BoardFileVO> fileList = fileUtils.parseFileInfo(seq, request, mhsr);
//		
//		if(CollectionUtils.isEmpty(fileList) == false) {
//			boardService.insertBoardFileList(fileList);
//		}
		
		boardService.updateBoard(vo);
		return "board-modify-form_결";
	}
	
	@RequestMapping(value="/deleteBoard")
	public String deleteBoard(BoardVO vo) {
		System.out.println("글 삭제 처리");
		
		boardService.deleteBoard(vo);
//		boardService.deleteFileList(vo.getBoardSeq());
		return "redirect:getBoardList";
	}
	

	
	
	
	
	
//	**** 자유게시판 컨트롤러
	@RequestMapping("/board/getFreeBoardList")
	public String getFreeBoardList(Model model) {
		model.addAttribute("FreeBoardList", boardService.getFreeBoardList());
		System.out.println("=============== 자유게시판 컨트롤러 탔음");
		System.out.println("model에 최종적으로 담긴값 : " + model);
		
		return "board-free_결";
		
	}
	
	
//	**** 나눔게시판 컨트롤러
	@RequestMapping("/board/getNanumBoardList")
	public String getNanumBoardList(Model model) {
		model.addAttribute("NanumBoardList", boardService.getNanumBoardList());
		System.out.println("================== 나눔게시판 컨트롤러 탔음");
		System.out.println("model에 최종적으로 담긴값 : " + model);
		
		return "board-nanum_결";
		
	}
	
//	**** 게시판 디테일
	@RequestMapping("/board/getBoardDetail")
//	리퀘스트파람으로 boardType을 자유게시판인지 나눔게시판인지 받아서 필터링해준다
	public String getBoard(@RequestParam int boardSeq, @RequestParam String boardType, Model model) {
		System.out.println("글 상세 조회 처리(보드 컨트롤러부분)");
		System.out.println("보드시꿘스 : " + boardSeq + ", 보드타입 : " + boardType);
		model.addAttribute("BoardDetail", boardService.getBoardDetail(boardSeq, boardType));
		System.out.println("=============게시판 상세보기 통과한거임");

		return "board-detail_결";
	}
	

}


