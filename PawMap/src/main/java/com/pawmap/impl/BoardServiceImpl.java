package com.pawmap.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.UserVO;
import com.pawmap.mapper.BoardMapper;
import com.pawmap.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;
	

	@Override
	public void insertTest(UserVO vo) {
		boardMapper.insertTest(vo);
	}

	@Override
	public void insertContent(BoardVO vo) {
		boardMapper.insertBoard(vo);
	}

//	자유게시판 리스트
	@Override
	public List<BoardVO> getFreeBoardList() {
		System.out.println("================자유게시판 리스트 impl 탔음");
		return boardMapper.getFreeBoardList();
	}

//	나눔게시판 리스트
	@Override
	public List<BoardVO> getNanumBoardList() {
		System.out.println("================나눔게시판 리스트 impl 탔음");
		return boardMapper.getNanumBoardList();
	}
	
	
//	게시판 상세조회
	@Override
	public BoardVO getBoardDetail(int boardSeq, String boardType) {
		System.out.println("=============보드서비스찍히는지확인");
		System.out.println("getBoardDetail - boardSeq = " + boardSeq + " boardType = " + boardType);
		return boardMapper.getBoardDetail(boardSeq, boardType);
	}

//	글 수정
	@Override
	public BoardVO updateBoard(BoardVO vo) {
		System.out.println("========수정 서비스 타는지 확인");
		boardMapper.updateBoard(vo);
		System.out.println(vo + "========수정 서비스 타기 완료");
		return vo;
	}

//	글 삭제
	@Override
	public void deleteBoard(BoardVO vo) {
		System.out.println("========삭제 서비스 타는지 확인");
		boardMapper.deleteBoard(vo);
		System.out.println(vo + "========삭제 서비스 타기 완료");
	}


}

