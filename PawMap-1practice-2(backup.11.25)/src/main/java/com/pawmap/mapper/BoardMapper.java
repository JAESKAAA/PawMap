package com.pawmap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.AdminManageBoardVO;
import com.pawmap.VO.BoardVO;

import com.pawmap.VO.CommentVO;

import com.pawmap.VO.UserVO;


@Mapper
public interface BoardMapper {


	void insertFreeAndNanumBoard(BoardVO vo);

	List<BoardVO> getFreeBoardList(Map<String,Object> map);

	BoardVO getFreeBoard(@Param("boardSeq") int boardSeq);

	void deleteFreeBoardBySeq(@Param("boardSeq") int boardSeq);

	void updateFreeBoardForm(BoardVO vo);

	int selectBoardCount(BoardVO vo);


	void insertReplyForFreeBoard(CommentVO commentVO);

	/* thomas lee added this line on Nov 26th 18:24pm for adminmanagement... below code would offer the function that admin could check the data from the DBMS... */
	AdminManageBoardVO getAdminBoardList(int userSeq);
	
}

