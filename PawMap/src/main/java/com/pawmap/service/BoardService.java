package com.pawmap.service;

import java.util.List;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.UserVO;

public interface BoardService {

	void insertTest(UserVO vo);
	
	void insertContent(BoardVO vo);
	
//	�����Խ��� ����Ʈ
	List<BoardVO> getFreeBoardList();

//	�����Խ��� ����Ʈ
	List<BoardVO> getNanumBoardList();
	
	
	
//	�� ����ȸ
	BoardVO getBoardDetail(int boardSeq, String boardType);

	
//	�� ����
	BoardVO updateBoard(BoardVO vo);

//	�� ����
	void deleteBoard(BoardVO vo);


}
