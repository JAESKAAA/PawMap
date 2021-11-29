package com.pawmap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pawmap.VO.AdminManageBoardVO;
import com.pawmap.VO.BoardVO;
import com.pawmap.VO.CommentVO;
import com.pawmap.VO.Criteria;
import com.pawmap.VO.PageVO;
import com.pawmap.service.BoardService;

@Controller
public class BoardController {
	
	static String keyword = "";
	
	@Autowired
	public BoardService boardService;

//	@ModelAttribute("conditionMap")
//	public Map<String, String> searchConditionMap() {
//		Map<String, String> conditionMap = new HashMap<String, String>();
//		conditionMap.put("제목", "title");
//		conditionMap.put("내용", "content");
//		
//		return conditionMap;
//	}
	
	@GetMapping("/board/form")
	public String getFreeAndNanumBoardForm() {
		return "board-free-form_결";
	}
	
	@PostMapping("/board/insertFreeAndNanumBoard")
	public String insertFreeAndNanumBoard(BoardVO vo) {
		

		System.out.println("insertFreeAndNanumBoard()탐");

		System.out.println("BoardVO ====== "+vo);
		
		boardService.insertFreeAndNanumBoard(vo);
		
		return "redirect:getFreeBoardList";
	}
	
	@RequestMapping("/board/getFreeBoardList")
	public String getFreeBoardList(BoardVO vo, Model model,Criteria cri){
		
		System.out.println("getFreeBoard() 탐");
		
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
		
		System.out.println("getKeywordType=================="+vo.getKeywordType());
		model.addAttribute("freeBoardList", boardService.getFreeBoardList(vo,cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
		model.addAttribute("keyword", vo.getKeyword());
		model.addAttribute("keywordType", vo.getKeywordType());
		
		return "board-free_결";
				
	}
	
	@GetMapping("/board/getFreeBoard")
	public String getFreeBoard(@RequestParam int boardSeq, Model model) {
		System.out.println("boardSeq ====== "+boardSeq);
		

		System.out.println(boardService.getFreeBoard(boardSeq));
		

		model.addAttribute("getFreeBoard",boardService.getFreeBoard(boardSeq));
		
		BoardVO voTest = boardService.getFreeBoard(boardSeq);
		System.out.println("보드타입 ========  "+voTest.getBoardType());
		
		return "board-detail_결";
	}
	
	@PostMapping("/board/deleteFreeBoard/api/{boardSeq}")
	@ResponseBody
	public  void deleteFreeBoardBySeq(@PathVariable int boardSeq ) {
		
		System.out.println("deleteFreeBoard 들어옴");
		System.out.println("deleteFreeBoard 들어옴 boardSeq : "+boardSeq);
		boardService.deleteFreeBoardBySeq(boardSeq);
		
	}
	
	@GetMapping("/board/updateFreeAndNanumBoardForm")
	public String updateFreeBoard(@RequestParam int boardSeq, Model model) {
		System.out.println("들어옴");
		System.out.println(boardSeq);
		
		model.addAttribute("getBoard",boardService.getFreeBoard(boardSeq));
		
		System.out.println(model);
		
		return "board-update-form_결";
	}
	
	@PostMapping("/board/updateFreeAndNanumBoardForm/api/{boardSeq}")
	@ResponseBody
	public void updateFreeBoardForm(@PathVariable int boardSeq, 
									@RequestBody BoardVO vo) {
		System.out.println("updateFreeAndNanumBoardForm  : " + "들어옴====");
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
		boardService.insertReplyForFreeBoard(commentVO);
	}

	
	/* thomas lee added below lines... this needs to be checked.. it is on nov 26th 18:34pm */
	
	@GetMapping("/board/getAdminBoardList")
	public String getAdminBoardList(@RequestParam int userSeq, Model model) {
		System.out.println("userSeq ====== "+userSeq);
		

		System.out.println(boardService.getAdminBoardList(userSeq));
		

		model.addAttribute("getAdminBoardList",boardService.getAdminBoardList(userSeq));
		
		AdminManageBoardVO voAdminTest = boardService.getAdminBoardList(userSeq);
		System.out.println("보드타입 ========  "+voAdminTest.getBoardType());
		
		return "adminpage2vetmange-tom";
	}
	
}
