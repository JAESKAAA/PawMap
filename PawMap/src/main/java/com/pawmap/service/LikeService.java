package com.pawmap.service;

import java.util.List;

import com.pawmap.VO.LikeVO;

public interface LikeService {

	LikeVO checkUserId(LikeVO vo);

	void insertLike(LikeVO vo);

	List<LikeVO> getNewStatusLikeList(String comNum);

	void deleteLike(int reviewSeq, String comNum);

	int getLatelyReviewSeq(String comNum);

	void makeLikeTable(int reviewSeq, String comNum);

	void disCountLike(LikeVO checkVO);

	void updateIncreaseCountLike(LikeVO checkVO);

}
