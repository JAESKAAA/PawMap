package com.pawmap.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.HospitalReviewVO;
import com.pawmap.mapper.HospitalReviewMapper;
import com.pawmap.service.HospitalReviewService;

@Service
public class HospitalReviewServiceImpl implements HospitalReviewService {
	
	@Autowired
	private HospitalReviewMapper hospitalReviewMapper;

	@Override
	public void insertHospitalReview(HospitalReviewVO hospitalReviewVO) {
		hospitalReviewMapper.insertHospitalReview(hospitalReviewVO);
	}

	@Override
	public List<HashMap<String, Object>> getHospitalReviewList(String hospitalComNum) {
		return hospitalReviewMapper.getHospitalReviewList(hospitalComNum);
	}

	@Override
	public void deleteHospitalReview(int reviewSeq, String comNum, String userId) {
		hospitalReviewMapper.deleteHospitalReview(reviewSeq,comNum,userId);
	}

	@Override
	public void updateHospitalReview(HospitalReviewVO hospitalReviewVO) {
		hospitalReviewMapper.updateHospitalReview(hospitalReviewVO);
	}

}
