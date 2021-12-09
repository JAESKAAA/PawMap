package com.pawmap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.HospitalReviewVO;

@Mapper
public interface HospitalReviewMapper {

	void insertHospitalReview(HospitalReviewVO hospitalReviewVO);

	List<HashMap<String, Object>> getHospitalReviewList(String hospitalComNum);

	void deleteHospitalReview(@Param("reviewSeq")int reviewSeq,@Param("comNum") String comNum,@Param("userId") String userId);

	void updateHospitalReview(HospitalReviewVO hospitalReviewVO);

}
