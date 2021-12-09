package com.pawmap.service;

import java.util.HashMap;
import java.util.List;

import com.pawmap.VO.HospitalReviewVO;

public interface HospitalReviewService {

	void insertHospitalReview(HospitalReviewVO hospitalReviewVO);

	List<HashMap<String, Object>> getHospitalReviewList(String hospitalComNum);

	void deleteHospitalReview(int reviewSeq, String comNum, String userId);

	void updateHospitalReview(HospitalReviewVO hospitalReviewVO);

}
