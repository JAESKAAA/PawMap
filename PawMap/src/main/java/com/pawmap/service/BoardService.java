package com.pawmap.service;

import java.util.HashMap;
import java.util.List;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.CommentVO;
import com.pawmap.VO.Criteria;

public interface BoardService {

	
	
	void insertFreeAndNanumBoard(BoardVO vo);

	List<BoardVO> getFreeBoardList(BoardVO vo, Criteria cri);

	BoardVO getFreeBoard(int boardSeq);

	void deleteFreeBoardBySeq(int boardSeq);

	void updateFreeBoardForm(BoardVO vo);

	int selectBoardCount(BoardVO vo);

	void insertReplyForFreeBoard(CommentVO commentVO);

	int getFreeBoardSeq();
	
	List<HashMap<String, Object>> getLatelyBoardListForBoardMain();

//	나눔게시판 리스트
	List<BoardVO> getNanumBoardList();
	
	// 나눔게시판 상세
	BoardVO getNanumBoard(int boardSeq);

//	글 상세조회
	BoardVO getBoardDetail(int boardSeq, String boardType);

	void updateNanumBoardForm(BoardVO vo);

	int getNanumBoardSeq();

	// 나눔게시판 글 삭제
	void deleteNanumBoardBySeq(int boardSeq);


	

	
	
}
