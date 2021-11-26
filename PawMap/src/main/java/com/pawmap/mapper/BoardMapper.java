package com.pawmap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.CommentVO;


@Mapper
public interface BoardMapper {


	void insertFreeAndNanumBoard(BoardVO vo);

	List<BoardVO> getFreeBoardList(Map<String,Object> map);

	BoardVO getFreeBoard(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);

	void deleteFreeBoardBySeq(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);

	void updateFreeBoardForm(BoardVO vo);

	int selectBoardCount(BoardVO vo);


	void insertReplyForFreeBoard(CommentVO commentVO);

//	나눔게시판 - 은혜 추가
	List<BoardVO> getNanumBoardList(Map<String,Object> map);


}

