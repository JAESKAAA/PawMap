package com.pawmap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
//	어떻게 분기해야하는지 생각해보기 (글작성하면 카테고리에 상관없이 자유게시판으로감)
	@GetMapping("/board/form")
	public String getFreeAndNanumBoardForm() {
		return "board-free-form_결";
	}
	
	
//	**** 나눔게시판 컨트롤러 / 은혜 추가파일
	@RequestMapping("/board/getNanumBoardList")
	public String getNanumBoardList(Model model, BoardVO vo, Criteria cri) {
		System.out.println("getNanumBoard() 탐");
		
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
		model.addAttribute("NanumBoardList", boardService.getNanumBoardList(vo,cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
		model.addAttribute("keyword", vo.getKeyword());
		model.addAttribute("keywordType", vo.getKeywordType());
		
		System.out.println("===========최종적으로 담긴 값(나눔게시판)==================");
		System.out.println("model = " + model);
		System.out.println("vo = " + vo);
		System.out.println("vo.getKeywordType = " + vo.getKeywordType());
//		System.out.println("cri = " cri);
		
		return "board-nanum_결";
		
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
		
		System.out.println("===========최종적으로 담긴 값(자유게시판)==================");
		System.out.println("model = " + model);
		System.out.println("vo = " + vo);
		System.out.println("vo.getKeywordType = " + vo.getKeywordType());
		
		
		
		return "board-free_결";
				
	}
	
	@GetMapping("/board/getFreeBoard")
	public String getFreeBoard(@RequestParam int boardSeq, @RequestParam String boardType, Model model) {
		System.out.println("boardSeq ====== "+boardSeq);
		

		System.out.println(boardService.getFreeBoard(boardSeq, boardType));
		

		model.addAttribute("getFreeBoard",boardService.getFreeBoard(boardSeq, boardType));
		
		BoardVO voTest = boardService.getFreeBoard(boardSeq, boardType);
		System.out.println("보드타입 ========  "+voTest.getBoardType());
		
		return "board-detail_결";
	}
	
	@PostMapping("/board/deleteFreeBoard/api/{boardSeq}")
	@ResponseBody
	public  void deleteFreeBoardBySeq(@PathVariable int boardSeq, @RequestParam String boardType) {
		
		System.out.println("deleteFreeBoard 들어옴");
		System.out.println("deleteFreeBoard 들어옴 boardSeq : "+ boardSeq);
		boardService.deleteFreeBoardBySeq(boardSeq, boardType);
		
	}
	
//	@GetMapping("" )
	@RequestMapping (value="/board/updateFreeAndNanumBoardForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateFreeBoard(@RequestParam int boardSeq, @RequestParam String boardType, Model model) {
		System.out.println("들어옴");
		System.out.println(boardSeq + "<-seq type->" +boardType);
		
		
		model.addAttribute("getBoard",boardService.getFreeBoard(boardSeq, boardType));
		System.out.println("updateFreeAndNanumBoardForm 컨트롤러 타기 완료");
		System.out.println(model);
		
		return "board-update-form_결";
	}
	
	@RequestMapping (value="/board/updateFreeAndNanumBoardForm/api/{boardSeq}&{boardType}", 
					method = {RequestMethod.GET, RequestMethod.POST})
//	@PostMapping("/board/updateFreeAndNanumBoardForm/api/{boardSeq}&{boardType}")
	@ResponseBody
	public void updateFreeBoardForm(@PathVariable int boardSeq,
									@RequestParam String boardType, 
									@RequestBody BoardVO vo) {
		System.out.println("1111111111111111updateFreeAndNanumBoardForm  : " + "들어옴====");
		System.out.println("vo ======== "+ vo);
		
		if(vo.getBoardSeq() == boardService.getFreeBoard(boardSeq, boardType).getBoardSeq()) {
			System.out.println("같습니다.");
			boardService.updateFreeBoardForm(vo);
		}
	}
	

	@PostMapping("board/insertReplyFreeBoard/api/{boardSeq}&{boardType}")
	@ResponseBody
	public void insertReplyFreeBoard(@PathVariable int boardSeq,
									@RequestParam String boardType, 
									 @RequestBody CommentVO	commentVO) {
		System.out.println("insertReplyFreeBoard =======  들어옴");
		System.out.println(commentVO);
		boardService.insertReplyForFreeBoard(commentVO);
	}


}
