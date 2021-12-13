package com.pawmap.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.LikeVO;
import com.pawmap.mapper.LikeMapper;
import com.pawmap.service.LikeService;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	private LikeMapper likeMapper;

	@Override
	public LikeVO checkUserId(LikeVO vo) {
		return likeMapper.checkUserId(vo);
	}

	@Override
	public void insertLike(LikeVO vo) {
		likeMapper.insertLike(vo);
	}

	@Override
	public List<LikeVO> getNewStatusLikeList(String comNum) {
		return likeMapper.getNewStatusLikeList(comNum);
	}

	@Override
	public void deleteLike(int reviewSeq, String comNum) {
		likeMapper.deleteLike(reviewSeq,comNum);
	}

	@Override
	public int getLatelyReviewSeq(String comNum) {
		return likeMapper.getLatelyReviewSeq(comNum);
	}

	@Override
	public void makeLikeTable(int reviewSeq, String comNum) {
		likeMapper.makeLikeTable(reviewSeq,comNum);
	}

	@Override
	public void disCountLike(LikeVO checkVO) {
		likeMapper.disCountLike(checkVO);
	}

	@Override
	public void updateIncreaseCountLike(LikeVO checkVO) {
		likeMapper.updateIncreaseCountLike(checkVO);
	}

}
