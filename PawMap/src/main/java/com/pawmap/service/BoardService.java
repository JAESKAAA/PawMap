package com.pawmap.service;

import java.util.List;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.CommentVO;
import com.pawmap.VO.Criteria;

public interface BoardService {
	
	void insertFreeAndNanumBoard(BoardVO vo);

	List<BoardVO> getFreeBoardList(BoardVO vo, Criteria cri);

//	나눔게시판 리스트 - 은혜 추가
	List<BoardVO> getNanumBoardList(BoardVO vo, Criteria cri);
	
	BoardVO getFreeBoard(int boardSeq, String boardType);

	void deleteFreeBoardBySeq(int boardSeq, String boardType);

	void updateFreeBoardForm(BoardVO vo);

	int selectBoardCount(BoardVO vo);


	void insertReplyForFreeBoard(CommentVO commentVO);






	
	
}
