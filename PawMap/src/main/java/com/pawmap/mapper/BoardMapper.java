package com.pawmap.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.CommentVO;
import com.pawmap.VO.UserVO;


@Mapper
public interface BoardMapper {

	

	int insertTest(UserVO vo);


	void insertFreeAndNanumBoard(BoardVO vo);

	List<BoardVO> getFreeBoardList(Map<String,Object> map);

	BoardVO getFreeBoard(@Param("boardSeq") int boardSeq);

	void deleteFreeBoardBySeq(@Param("boardSeq") int boardSeq);

	void updateFreeBoardForm(BoardVO vo);

	int selectBoardCount(BoardVO vo);

	void insertReplyForFreeBoard(CommentVO commentVO);


	int getFreeBoardSeq();

	List<HashMap<String, Object>> getLatelyBoardListForBoardMain();

	// 관리자 페이지에서 community 게시판 부를때 사용하는 메소드
	
	List<BoardVO> getCommunityBoardList(Map<String,Object> map);
	
	List<HashMap<String, Object>> getLatelyCommunityBoardListForBoardMain();


}

