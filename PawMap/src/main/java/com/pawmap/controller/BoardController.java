package com.pawmap.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

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

		
		int boardSeq = boardService.getFreeBoardSeq();
		String userId = vo.getUserId();
 		
		System.out.println("boardSeq=========="+boardSeq);
		System.out.println("userId=========="+userId);

		
		FileUtils fileUtils = new FileUtils();
		List<FileVO> fileList = fileUtils.parseFileInfo(boardSeq, request, mhsr,userId);
		
		if(CollectionUtils.isEmpty(fileList) == false) {
			fileService.insertBoardFileList(fileList);
		}


		System.out.println("insertFreeAndNanumBoard()탐");
		System.out.println("BoardVO ====== "+vo);
		
		boardService.insertFreeAndNanumBoard(vo);
		
		return "redirect:getFreeBoardList";
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
	public  void deleteFreeBoardBySeq(@PathVariable int boardSeq ) {
		
		System.out.println("deleteFreeBoard 들어옴");
		System.out.println("deleteFreeBoard 들어옴 boardSeq : "+boardSeq);
		boardService.deleteFreeBoardBySeq(boardSeq);
		commentService.deleteCommentsBySeq(boardSeq);
		fileService.deleteFileByBoardSeq(boardSeq);
		
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
	

	@PostMapping("board/insertReplyFreeBoard/api/{boardSeq}")
	@ResponseBody
	public void insertReplyFreeBoard(@PathVariable int boardSeq,
									 @RequestBody CommentVO	commentVO) {
		System.out.println("insertReplyFreeBoard =======  들어옴");
		System.out.println(commentVO);
		commentService.insertReplyForFreeBoard(commentVO);
		
	}
	
	@PostMapping("/board/deleteCommentOnFreeBoard")
	public String deleteCommentOnFreeBoard(int commentSeq, int boardSeq) {
		System.out.println("adadasdsadsadada");
		System.out.println(commentSeq);
		System.out.println(boardSeq);
		
		commentService.deleteCommentOnFreeBoard(commentSeq,boardSeq);
		
		return "redirect:getFreeBoard?boardSeq="+boardSeq;
		
	}
	
	@RequestMapping("/board/updateCommentOnFreeBoard")
	public String updateCommentOnFreeBoard(CommentVO commentVO) {
		System.out.println("updateCommentOnFreeBoard() 들어옴");
		System.out.println("commentSeq========"+commentVO);
		int boardSeq = commentVO.getBoardSeq();
		commentService.updateCommentOnFreeBoard(commentVO);
		
		return "redirect:getFreeBoard?boardSeq="+boardSeq;
		
	}
	
	@RequestMapping("/board/saperateDeleteFileOnFreeBoard")
	public String saperateDeleteFile(int fileSeq, int boardSeq) {
		System.out.println(fileSeq);
		System.out.println(boardSeq);
		System.out.println("saperateDeleteFile 들엉옴");
		
		fileService.deleteOneFile(fileSeq,boardSeq);
		
		return "redirect:updateFreeAndNanumBoardForm?boardSeq="+boardSeq;
		
	}
	
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

	
	

}
