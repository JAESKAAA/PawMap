package com.pawmap.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.CommentVO;
import com.pawmap.mapper.CommentMapper;
import com.pawmap.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper commentMapper;

	@Override
	public void insertReplyForFreeBoard(CommentVO commentVO) {
		commentMapper.insertReplyForFreeBoard(commentVO);
	}

	@Override
	public List<HashMap<String, Object>> getReplyListByBoardSeq(int boardSeq) {
		System.out.println("CommentServiceImpl 에서의 getReplyListByBoardSeq====="+boardSeq);
		return commentMapper.getReplyListByBoardSeq(boardSeq);
	}

	@Override
	public void deleteCommentOnFreeBoard(int commentSeq, int boardSeq) {
		commentMapper.deleteCommentOnFreeBoard(commentSeq,boardSeq);
	}

	@Override
	public void updateCommentOnFreeBoard(CommentVO commentVO) {
		commentMapper.updateCommentOnFreeBoard(commentVO);
	}


	@Override
	public void deleteCommentsBySeq(int boardSeq) {
		commentMapper.deleteCommentsBySeq(boardSeq);
	}

	@Override
	public void insertReplyForNanumBoard(CommentVO commentVO) {
		commentMapper.insertReplyForNanumBoard(commentVO);
	}

	@Override
	public void deleteCommentOnNanumBoard(int commentSeq, int boardSeq) {
		commentMapper.deleteCommentOnNanumBoard(commentSeq,boardSeq);
		
	}

	@Override
	public void updateCommentOnNanumBoard(CommentVO commentVO) {
		commentMapper.updateCommentOnNanumBoard(commentVO);
		
	}

	@Override
	public List<HashMap<String, Object>> getReplyListByNanumBoardSeq(int boardSeq) {
		System.out.println("CommentServiceImpl의  getReplyListByNanumBoardSeq====="+boardSeq);
		return commentMapper.getReplyListByNanumBoardSeq(boardSeq);
	}

	
	
	
}
