package com.pawmap.service;

import java.util.List;

import com.pawmap.VO.AdminManageBoardVO;
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
	
	/* thomas lee added this line on Nov 26th 18:24pm for adminmanagement... below code would offer the function that admin could check the data from the DBMS... */
	AdminManageBoardVO getAdminBoardList(int userSeq);
	
}