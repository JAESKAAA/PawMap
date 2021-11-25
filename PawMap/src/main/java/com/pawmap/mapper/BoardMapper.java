package com.pawmap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.UserVO;


@Mapper
public interface BoardMapper {

//	글 등록
	int insertTest(UserVO vo);
	
	int insertBoard(BoardVO vo);
	
	
	//글 수정
	void updateBoard(BoardVO vo);
	
	//글 삭제
	void deleteBoard(BoardVO vo);
	
	
	

//	자유게시판
	List<BoardVO> getFreeBoardList();
	
//	나눔게시판
	List<BoardVO> getNanumBoardList();
	
	
	
//	글 상세조회
	BoardVO getBoardDetail(@Param ("boardSeq") int boardSeq, @Param ("boardType") String boardType);
	
}