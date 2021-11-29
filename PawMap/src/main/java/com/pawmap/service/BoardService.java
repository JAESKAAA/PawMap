package com.pawmap.service;

import java.util.List;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.CommentVO;
import com.pawmap.VO.Criteria;
<<<<<<< HEAD
=======
import com.pawmap.VO.FileVO;
import com.pawmap.VO.UserVO;
>>>>>>> 875d0942867d0b227aa30f8a55159abf263e7c76

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

<<<<<<< HEAD




=======
	int getFreeBoardSeq();

	
>>>>>>> 875d0942867d0b227aa30f8a55159abf263e7c76

	
	
}
