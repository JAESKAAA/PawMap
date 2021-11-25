package com.pawmap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.UserVO;


@Mapper
public interface BoardMapper {

//	�� ���
	int insertTest(UserVO vo);
	
	int insertBoard(BoardVO vo);
	
	
	//�� ����
	void updateBoard(BoardVO vo);
	
	//�� ����
	void deleteBoard(BoardVO vo);
	
	
	

//	�����Խ���
	List<BoardVO> getFreeBoardList();
	
//	�����Խ���
	List<BoardVO> getNanumBoardList();
	
	
	
//	�� ����ȸ
	BoardVO getBoardDetail(@Param ("boardSeq") int boardSeq, @Param ("boardType") String boardType);
	
}