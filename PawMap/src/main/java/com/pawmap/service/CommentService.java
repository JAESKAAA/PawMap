package com.pawmap.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pawmap.VO.CommentVO;


public interface CommentService {

	void insertReplyForFreeBoard(CommentVO commentVO);

	List<HashMap<String, Object>> getReplyListByBoardSeq(int boardSeq);

	void deleteCommentOnFreeBoard(int commentSeq, int boardSeq);
	
	void updateCommentOnFreeBoard(CommentVO commentVO);

	void deleteCommentsBySeq(int boardSeq);

	
}
