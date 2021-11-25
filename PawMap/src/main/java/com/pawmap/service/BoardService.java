package com.pawmap.service;

import java.util.List;

import com.pawmap.VO.BoardVO;

import com.pawmap.VO.CommentVO;

import com.pawmap.VO.Criteria;
import com.pawmap.VO.UserVO;

public interface BoardService {

	void insertTest(UserVO vo);
	
	void insertFreeAndNanumBoard(BoardVO vo);

	List<BoardVO> getFreeBoardList(BoardVO vo, Criteria cri);

	BoardVO getFreeBoard(int boardSeq);

	void deleteFreeBoardBySeq(int boardSeq);

	void updateFreeBoardForm(BoardVO vo);

	int selectBoardCount(BoardVO vo);


	void insertReplyForFreeBoard(CommentVO commentVO);

	
	
}
