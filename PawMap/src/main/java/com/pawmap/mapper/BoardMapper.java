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

//	나눔게시판
	List<BoardVO> getNanumBoardList(Map<String, Object> map);

//	글 상세조회
	BoardVO getBoardDetail(@Param ("boardSeq") int boardSeq, @Param ("boardType") String boardType);


	BoardVO getNanumBoard(@Param("boardSeq") int boardSeq);


	void updateNanumBoardForm(BoardVO vo);
	
 	int getNanumBoardSeq();

	void deleteNanumBoardBySeq(@Param("boardSeq") int boardSeq);


	List<HashMap<String, Object>> getLatelyBoardListForNanumBoardMain();


	int selectNanumBoardCount(BoardVO vo);



}

