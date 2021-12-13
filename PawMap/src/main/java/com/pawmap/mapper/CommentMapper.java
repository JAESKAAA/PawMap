package com.pawmap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.CommentVO;

@Mapper
public interface CommentMapper {

	void insertReplyForFreeBoard(CommentVO commentVO);

	List<HashMap<String, Object>> getReplyListByBoardSeq(@Param("boardSeq")int boardSeq);

	void deleteCommentOnFreeBoard(@Param("commentSeq")int commentSeq, 
								  @Param("boardSeq")int boardSeq);
	
	void updateCommentOnFreeBoard(CommentVO commentVO);

	void deleteCommentsBySeq(@Param("boardSeq") int boardSeq);

	void insertReplyForNanumBoard(CommentVO commentVO);

	void deleteCommentOnNanumBoard(@Param("commentSeq")int commentSeq, 
								  @Param("boardSeq")int boardSeq);

	void updateCommentOnNanumBoard(CommentVO commentVO);

	List<HashMap<String, Object>> getReplyListByNanumBoardSeq(@Param("boardSeq")int boardSeq);

	void deleteCommentsByNanumSeq(@Param("boardSeq") int boardSeq);


}
