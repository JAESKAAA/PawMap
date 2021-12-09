package com.pawmap.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.CommentVO;
import com.pawmap.VO.Criteria;
import com.pawmap.VO.FileVO;
import com.pawmap.VO.PageVO;
import com.pawmap.service.BoardService;
import com.pawmap.service.CommentService;
import com.pawmap.service.FileService;
import com.pawmap.util.FileUtils;

@Controller
public class BoardController {
	
	static String keyword = "";
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private FileService fileService;
	
	
	@GetMapping("/board/form")
	public String getFreeAndNanumBoardForm() {
		return "board-free-form_결";
	}
	
	@PostMapping("/board/insertFreeAndNanumBoard")
	public String insertFreeAndNanumBoard(BoardVO vo, HttpServletRequest request,
			MultipartHttpServletRequest mhsr) throws IOException  {

		int boardSeq=0;
		if(vo.getBoardType().equals("f")) {
			boardSeq = boardService.getFreeBoardSeq();
		}else {
			 boardSeq = boardService.getNanumBoardSeq();
		}
		String userId = vo.getUserId();
 		
		System.out.println("boardSeq=========="+boardSeq);
		System.out.println("userId=========="+userId);

		
			FileUtils fileUtils = new FileUtils();
	
		List<FileVO> fileList = fileUtils.parseFileInfo(boardSeq, request, mhsr,userId);
		
		if(CollectionUtils.isEmpty(fileList) == false) {
			
			if(vo.getBoardType().equals("f")) {
				System.out.println("프리보드파일인서트 탔음");
				fileService.insertBoardFileList(fileList);
			}else {
				fileService.insertNanumBoardFileList(fileList.get(0));
				System.out.println("나눔파일인서트 탔음");
			}
		}


		System.out.println("insertFreeAndNanumBoard()탐");
		System.out.println("BoardVO ====== "+vo);
		
		boardService.insertFreeAndNanumBoard(vo);
		
		if(vo.getBoardType().equals("f")) {
			return "redirect:getFreeBoardList";
			
		} else {
			return "redirect:getNanumBoardList";
		}
	}
	
	@RequestMapping("/board/getFreeBoardList")
	public String getFreeBoardList(BoardVO vo, Model model,Criteria cri){
		
		System.out.println("getFreeBoardList() 탐");
		
		if(vo.getKeywordType() == null || vo.getKeywordType().isEmpty()) {
			vo.setKeywordType("titleAndContent");
		}
		if(vo.getKeyword() == null) {
			vo.setKeyword("");
		}
		
		if(!keyword.equals(vo.getKeyword())) {
			System.out.println("다릅니다.");
			cri.setPageNum(1);
		}

		keyword = vo.getKeyword();
		
		int total = boardService.selectBoardCount(vo);
		
		List<HashMap<String,Object>> latelyBoardListForMain = boardService.getLatelyBoardListForBoardMain();
		
		System.out.println("getFreeBoardList 의 latelyBoardListForMain ============"+ latelyBoardListForMain);
		
		model.addAttribute("freeBoardList", boardService.getFreeBoardList(vo,cri));
		model.addAttribute("latelyBoardListForMain", latelyBoardListForMain);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		model.addAttribute("keyword", vo.getKeyword());
		model.addAttribute("keywordType", vo.getKeywordType());
		
		return "board-free_결";
				
	}
	
	@GetMapping("/board/getFreeBoard")
	public String getFreeBoard(@RequestParam int boardSeq, Model model) {
		System.out.println("getFreeBoard============ 탐");
		System.out.println("getFreeBoard boardSeq ========== "+boardSeq);
		
		// 댓글 리스트로 가져오기
		List<HashMap<String,Object>> replyList = commentService.getReplyListByBoardSeq(boardSeq);

		// 파일리스트 가져오기
		List<FileVO> fileList = fileService.getFileListByFreeBoardSeq(boardSeq);
		
		System.out.println("fileList ============== "+ fileList);
		

		model.addAttribute("freeBoardFileList",fileList);
		model.addAttribute("commentSize",replyList.size());
		model.addAttribute("freeBoardReplyList",replyList);
		model.addAttribute("getFreeBoard",boardService.getFreeBoard(boardSeq));
		
		return "board-detail_결";
	}
	
	@PostMapping("/board/deleteFreeBoard/api/{boardSeq}")
	@ResponseBody
	public void deleteFreeBoardBySeq(@PathVariable int boardSeq ) {
		
		System.out.println("deleteFreeBoard 들어옴");
		System.out.println("deleteFreeBoard 들어옴 boardSeq : "+boardSeq);
		boardService.deleteFreeBoardBySeq(boardSeq);
		commentService.deleteCommentsBySeq(boardSeq);
		fileService.deleteFileByBoardSeq(boardSeq);
		
	}
	
	// 나눔게시판 글삭제 관련 메소드
	@PostMapping("/board/deleteNanumBoard/api/{boardSeq}")
	@ResponseBody
	public void deleteNanumBoardBySeq(@PathVariable int boardSeq ) {
		
		System.out.println("deleteFreeBoard 들어옴");
		System.out.println("deleteFreeBoard 들어옴 boardSeq : "+boardSeq);
		boardService.deleteNanumBoardBySeq(boardSeq);
		commentService.deleteCommentsBySeq(boardSeq);
		fileService.deleteFileByBoardSeqOnNanumSeq(boardSeq);
		
	}
	
	
	@GetMapping("/board/updateFreeAndNanumBoardForm")
	public String updateFreeBoard(@RequestParam int boardSeq, Model model) {
		System.out.println("updateFreeBoard   들어옴");
		System.out.println(boardSeq);
		
		List<FileVO> fileList = fileService.getFileListByFreeBoardSeq(boardSeq);
		
		model.addAttribute("fileList",fileList);
		model.addAttribute("getBoard",boardService.getFreeBoard(boardSeq));
		
		System.out.println(model);
		
		return "board-update-form_결";
	}
	
	//나눔게시판 게시글 업데이트 관련 메서드
	@GetMapping("/board/updateNanumBoardForm")
	public String updateNanumBoard(@RequestParam int boardSeq, Model model, String boardType) {
		System.out.println("updateFreeBoard   들어옴");
		System.out.println(boardSeq);
		
		System.out.println("보드타입== "+boardType);
		
		List<FileVO> fileList = fileService.getFileListByNanumBoardSeq(boardSeq, boardType);
		
		System.out.println(fileList);
		
		model.addAttribute("fileList",fileList);
		model.addAttribute("getBoard",boardService.getNanumBoard(boardSeq));
		
		System.out.println(model);
		
		return "board-update-form_결";
	}
	
	@PostMapping("/board/updateNanumBoardForm/api/{boardSeq}")
	@ResponseBody
	public void updateNanumBoardForm(@PathVariable int boardSeq, 
									@RequestBody BoardVO vo) {
		System.out.println("updateNanumBoardForm  : " + "들어옴====");
		System.out.println("vo ======== "+ vo);
		
		if(vo.getBoardSeq() == boardService.getNanumBoard(boardSeq).getBoardSeq()) {
			System.out.println("같습니다.");
			boardService.updateNanumBoardForm(vo);
		}
	}
	
	
	
	@PostMapping("/board/updateFreeAndNanumBoardForm/api/{boardSeq}")
	@ResponseBody
	public void updateFreeBoardForm(@PathVariable int boardSeq, 
									@RequestBody BoardVO vo) {
		System.out.println("updateFreeBoardForm  : " + "들어옴====");
		System.out.println("vo ======== "+ vo);
		
		if(vo.getBoardSeq() == boardService.getFreeBoard(boardSeq).getBoardSeq()) {
			System.out.println("같습니다.");
			boardService.updateFreeBoardForm(vo);
		}
	}
	// 코멘트 관련 메소드 시작===============================================
	

	@PostMapping("board/insertReplyFreeBoard/api/{boardSeq}")
	@ResponseBody
	public void insertReplyFreeBoard(@PathVariable int boardSeq,
									 @RequestBody CommentVO	commentVO) {
		System.out.println("insertReplyFreeBoard =======  들어옴");
		System.out.println(commentVO);
		commentService.insertReplyForFreeBoard(commentVO);
		
	}
	
	// 나눔게시판 덧글 등록
	@PostMapping("board/insertReplyNanumBoard/api/{boardSeq}")
	@ResponseBody
	public void insertReplyNanumBoard(@PathVariable int boardSeq,
									 @RequestBody CommentVO	commentVO) {
		System.out.println("insertReplyNanumBoard =======  들어옴");
		System.out.println(commentVO);
		commentService.insertReplyForNanumBoard(commentVO);
		
	}
	
	
	
	@PostMapping("/board/deleteCommentOnFreeBoard")
	public String deleteCommentOnFreeBoard(int commentSeq, int boardSeq) {
		System.out.println("adadasdsadsadada");
		System.out.println(commentSeq);
		System.out.println(boardSeq);
		
		commentService.deleteCommentOnFreeBoard(commentSeq,boardSeq);
		
		return "redirect:getFreeBoard?boardSeq="+boardSeq;
		
	}
	
	
	// 나눔게시판 코멘트 삭제
	@PostMapping("/board/deleteCommentOnNanumBoard")
	public String deleteCommentOnNanumBoard(int commentSeq, int boardSeq) {
		System.out.println("deleteCommentOnNanumBoard 진입===========");
		System.out.println(commentSeq);
		System.out.println(boardSeq);
		
		commentService.deleteCommentOnNanumBoard(commentSeq,boardSeq);
		
		return "redirect:getNanumBoard?boardSeq="+boardSeq;
		
	}
	
	@RequestMapping("/board/updateCommentOnFreeBoard")
	public String updateCommentOnFreeBoard(CommentVO commentVO) {
		System.out.println("updateCommentOnFreeBoard() 들어옴");
		System.out.println("commentSeq========"+commentVO);
		int boardSeq = commentVO.getBoardSeq();
		commentService.updateCommentOnFreeBoard(commentVO);
		
		return "redirect:getFreeBoard?boardSeq="+boardSeq;
		
	}
	
	
	// 나눔게시판 코멘트 업데이트
	@RequestMapping("/board/updateCommentOnNanumBoard")
	public String updateCommentOnNanumBoard(CommentVO commentVO) {
		System.out.println("updateCommentOnNanumBoard 진입==============");
		System.out.println("commentSeq========"+commentVO);
		int boardSeq = commentVO.getBoardSeq();
		commentService.updateCommentOnNanumBoard(commentVO);
		
		return "redirect:getNanumBoard?boardSeq="+boardSeq;
		
	}
	
	
	
	
	@RequestMapping("/board/saperateDeleteFileOnFreeBoard")
	public String saperateDeleteFile(int fileSeq, int boardSeq) {
		System.out.println(fileSeq);
		System.out.println(boardSeq);
		System.out.println("saperateDeleteFile 들엉옴");
		
		fileService.deleteOneFile(fileSeq,boardSeq);
		
		return "redirect:updateFreeAndNanumBoardForm?boardSeq="+boardSeq;
		
	}
	
	
	
	
	// 자유게시판 파일 인서트======================================================
	
	@RequestMapping("/board/updateFreeBoardFormInsertFiles")
	public String updateFreeBoardFormInsertFiles(String userId,HttpServletRequest request,
			MultipartHttpServletRequest mhsr, int boardSeq) throws IOException {
		
		System.out.println("들어옴");
		
		FileUtils fileUtils = new FileUtils();
		List<FileVO> fileList = fileUtils.parseFileInfo(boardSeq, request, mhsr,userId);
		
		if(CollectionUtils.isEmpty(fileList) == false) {
			fileService.insertBoardFileList(fileList);
		}
		
		return "redirect:updateFreeAndNanumBoardForm?boardSeq="+boardSeq;
		
	}

	// 나눔게시판 컨트롤러
	@RequestMapping("/board/getNanumBoardList")
	public String getNanumBoardList(BoardVO vo, Model model, Criteria cri) {
		
		System.out.println("getNanumBoardList 진입===============");
		
		
//		cri.setPageNum(1);
		cri.setAmount(9);
		
		
		if(vo.getKeywordType() == null || vo.getKeywordType().isEmpty()) {
			vo.setKeywordType("titleAndContent");
		}
		if(vo.getKeyword() == null) {
			vo.setKeyword("");
		}
		
		if(!keyword.equals(vo.getKeyword())) {
			System.out.println("다릅니다.");
			cri.setPageNum(1);
		}

		keyword = vo.getKeyword();
		
		int total = boardService.selectNanumBoardCount(vo);
		
		List<HashMap<String,Object>> latelyNanumBoardListForMain = boardService.getLatelyBoardListForNanumBoardMain();
		
		System.out.println("getNanumBoardList 의 latelyNanumBoardListForMain ============"+ latelyNanumBoardListForMain);
		
		
		model.addAttribute("NanumBoardList", boardService.getNanumBoardList(vo,cri));
		model.addAttribute("latelyNanumBoardListForMain", latelyNanumBoardListForMain);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		model.addAttribute("keyword", vo.getKeyword());
		model.addAttribute("keywordType", vo.getKeywordType());
		
		System.out.println("================== 나눔게시판 컨트롤러 탔음");
		System.out.println("model에 최종적으로 담긴값 : " + model);
		
		return "board-nanum_결";
		
	}
	
	// 나눔게시판 리스트 가져오기
	@GetMapping("/board/getNanumBoard")
	public String getNanumBoard(@RequestParam int boardSeq, Model model) {
		System.out.println("getNanumBoard============ 탐");
		System.out.println("getNanumBoard boardSeq ========== "+boardSeq);
		
		// 댓글 리스트로 가져오기
		List<HashMap<String,Object>> replyList = commentService.getReplyListByNanumBoardSeq(boardSeq);

		// 파일리스트 가져오기
		List<FileVO> fileList = fileService.getFileListByNanumBoardSeq(boardSeq,"s");
		
		System.out.println("fileList ============== "+ fileList);
		System.out.println("나눔보드 테스터 ===== "+boardService.getNanumBoard(boardSeq));

		model.addAttribute("nanumBoardFileList",fileList);
		model.addAttribute("commentSize",replyList.size());
		model.addAttribute("nanumBoardReplyList",replyList);
		model.addAttribute("getNanumBoard",boardService.getNanumBoard(boardSeq));
		
		return "board-detail_결";

	}
	
	// 나눔게시판 파일 삭제
	@RequestMapping("/board/saperateDeleteFileOnNanumBoard")
	public String saperateDeleteFileOnNanum(int fileSeq, int boardSeq) {
		System.out.println(fileSeq);
		System.out.println(boardSeq);
		System.out.println("saperateDeleteFileOnNanum 진입======");
		
		fileService.deleteOneFile(fileSeq,boardSeq);
		
		return "redirect:updateNanumBoardForm?boardSeq="+boardSeq;
		
	}
	
	// 나눔게시판 파일 업데이트
	@RequestMapping("/board/updateNanumBoardFormInsertFiles")
	public String updateNanumBoardFormInsertFiles(String userId,HttpServletRequest request,
			MultipartHttpServletRequest mhsr, int boardSeq) throws IOException {
		
		System.out.println("updateNanumBoardFormInsertFiles 진입=====");
		
		FileUtils fileUtils = new FileUtils();
		List<FileVO> fileList = fileUtils.parseFileInfo(boardSeq, request, mhsr, userId);
		
		FileVO fileVO = fileList.get(0);
		
		System.out.println("파일리스트 출력 == "+ fileVO);
		if(CollectionUtils.isEmpty(fileList) == false) {
			fileService.insertNanumBoardFileList(fileVO);
		}
		
		return "redirect:updateNanumBoardForm?boardSeq="+boardSeq;
		
	}
	
////	**** 게시판 디테일
//	@RequestMapping("/board/getBoardDetail")
////	리퀘스트파람으로 boardType을 자유게시판인지 나눔게시판인지 받아서 필터링해준다
//	public String getBoard(@RequestParam int boardSeq, @RequestParam String boardType, Model model) {
//		System.out.println("글 상세 조회 처리(보드 컨트롤러부분)");
//		System.out.println("보드시퀀스 : " + boardSeq + ", 보드타입 : " + boardType);
//		model.addAttribute("BoardDetail", boardService.getBoardDetail(boardSeq, boardType));
//		System.out.println("=============게시판 상세보기 통과한거임");
//
//		return "board-detail_결";
//	}
}
