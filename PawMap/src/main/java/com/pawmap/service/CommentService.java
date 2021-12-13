package com.pawmap.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pawmap.VO.CommentVO;


public interface CommentService {

	void insertReplyForFreeBoard(CommentVO commentVO);

	void insertReplyForNanumBoard(CommentVO commentVO);
	
	List<HashMap<String, Object>> getReplyListByBoardSeq(int boardSeq);

	void deleteCommentOnFreeBoard(int commentSeq, int boardSeq);
	
	void updateCommentOnFreeBoard(CommentVO commentVO);

	void deleteCommentsBySeq(int boardSeq);

	void deleteCommentOnNanumBoard(int commentSeq, int boardSeq);

	void updateCommentOnNanumBoard(CommentVO commentVO);

	List<HashMap<String, Object>> getReplyListByNanumBoardSeq(int boardSeq);

	void deleteCommentsByNanumSeq(int boardSeq);

	
}
