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
		return "board-free-form_��";
	}
	
	@PostMapping("/board/form")
	public String getBoardFormm(BoardVO vo) {


		System.out.println("boardController����");
		System.out.println("==================================="+vo.getBoardType());
		boardService.insertContent(vo);
		
		//ȭ�� �׺���̼�(�Խñ� ��� �Ϸ� �� �Խñ� ������� �̵�)
		return "redirect:getBoardList";
	}
	
	
	
//	**** �� ����
	//ModelAttribute�� ���ǿ� board��� �̸����� ����� ��ü�� �ִ��� ã�Ƽ� Command��ü�� �����
	@RequestMapping(value="/updateBoard")
	public String updateBoard(@ModelAttribute("board") BoardVO vo, HttpServletRequest request
				) throws IOException {
//		MultipartHttpServletRequest mhsr <- ���Ͼ��ε����
		System.out.println("�� ���� ó��");
		System.out.println("�Ϸù�ȣ : " + vo.getBoardSeq());
		System.out.println("���� : " + vo.getTitle());
		System.out.println("�ۼ��� �̸� : " + vo.getUserId());
		System.out.println("���� : " + vo.getContent());
		System.out.println("����� : " + vo.getRegDate());
//		System.out.println("��ȸ�� : " + vo.getCnt()); ��ȸ�� �Ⱦ�
		
		
//		���Ͼ��ε�κ�
//		int seq = vo.getBoardSeq();
//		
//		FileUtils fileUtils = new FileUtils();
//		List<BoardFileVO> fileList = fileUtils.parseFileInfo(seq, request, mhsr);
//		
//		if(CollectionUtils.isEmpty(fileList) == false) {
//			boardService.insertBoardFileList(fileList);
//		}
		
		boardService.updateBoard(vo);
		return "board-modify-form_��";
	}
	
	@RequestMapping(value="/deleteBoard")
	public String deleteBoard(BoardVO vo) {
		System.out.println("�� ���� ó��");
		
		boardService.deleteBoard(vo);
//		boardService.deleteFileList(vo.getBoardSeq());
		return "redirect:getBoardList";
	}
	

	
	
	
	
	
//	**** �����Խ��� ��Ʈ�ѷ�
	@RequestMapping("/board/getFreeBoardList")
	public String getFreeBoardList(Model model) {
		model.addAttribute("FreeBoardList", boardService.getFreeBoardList());
		System.out.println("=============== �����Խ��� ��Ʈ�ѷ� ����");
		System.out.println("model�� ���������� ��䰪 : " + model);
		
		return "board-free_��";
		
	}
	
	
//	**** �����Խ��� ��Ʈ�ѷ�
	@RequestMapping("/board/getNanumBoardList")
	public String getNanumBoardList(Model model) {
		model.addAttribute("NanumBoardList", boardService.getNanumBoardList());
		System.out.println("================== �����Խ��� ��Ʈ�ѷ� ����");
		System.out.println("model�� ���������� ��䰪 : " + model);
		
		return "board-nanum_��";
		
	}
	
//	**** �Խ��� ������
	@RequestMapping("/board/getBoardDetail")
//	������Ʈ�Ķ����� boardType�� �����Խ������� �����Խ������� �޾Ƽ� ���͸����ش�
	public String getBoard(@RequestParam int boardSeq, @RequestParam String boardType, Model model) {
		System.out.println("�� �� ��ȸ ó��(���� ��Ʈ�ѷ��κ�)");
		System.out.println("����ÅR�� : " + boardSeq + ", ����Ÿ�� : " + boardType);
		model.addAttribute("BoardDetail", boardService.getBoardDetail(boardSeq, boardType));
		System.out.println("=============�Խ��� �󼼺��� ����Ѱ���");

		return "board-detail_��";
	}
	

}


