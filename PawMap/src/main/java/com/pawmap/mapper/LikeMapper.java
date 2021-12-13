package com.pawmap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.LikeVO;

@Mapper
public interface LikeMapper {

	LikeVO checkUserId(LikeVO vo);

	void insertLike(LikeVO vo);

	List<LikeVO> getNewStatusLikeList(@Param("comNum")String comNum);

	void deleteLike(@Param("reviewSeq")int reviewSeq,@Param("comNum") String comNum);

	int getLatelyReviewSeq(@Param("comNum")String comNum);

	void makeLikeTable(@Param("reviewSeq")int reviewSeq,@Param("comNum") String comNum);

	void disCountLike(LikeVO checkVO);

	void updateIncreaseCountLike(LikeVO checkVO);

}
