package com.pawmap.service;

import java.util.List;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.UserVO;

public interface BoardService {

	void insertTest(UserVO vo);
	
	void insertContent(BoardVO vo);
	
//	자유게시판 리스트
	List<BoardVO> getFreeBoardList();

//	나눔게시판 리스트
	List<BoardVO> getNanumBoardList();
	
	
	
//	글 상세조회
	BoardVO getBoardDetail(int boardSeq, String boardType);

	
//	글 수정
	BoardVO updateBoard(BoardVO vo);

//	글 삭제
	void deleteBoard(BoardVO vo);


}
