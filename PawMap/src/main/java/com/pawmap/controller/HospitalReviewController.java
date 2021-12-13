package com.pawmap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pawmap.VO.HospitalReviewVO;
import com.pawmap.service.HospitalReviewService;
import com.pawmap.service.LikeService;

@Controller
public class HospitalReviewController {
	
	@Autowired
	private HospitalReviewService hospitalReviewService;
	
	@Autowired
	private LikeService likeService;

	@RequestMapping("insertHospitalReview")
	public String insertHospitalReview(HospitalReviewVO hospitalReviewVO) {
		System.out.println("HospitalReviewVO 들어옴");
		System.out.println("hospitalReviewVO ===== "+ hospitalReviewVO);
		
		int reviewSeq = likeService.getLatelyReviewSeq(hospitalReviewVO.getComNum());
		hospitalReviewService.insertHospitalReview(hospitalReviewVO);
		likeService.makeLikeTable(reviewSeq,hospitalReviewVO.getComNum());
		
		System.out.println("reviewSeq ====== "+reviewSeq);
		
		return "redirect:/detailHospital?hospitalSeq="+hospitalReviewVO.getHospitalSeq()+"#review-start";
	}
	
	@RequestMapping("deleteHospitalReview")
	public String deleteHospitalReview(int reviewSeq, String comNum, String userId, int hospitalSeq) {
		System.out.println("deleteHospitalReview 들어옴");
		System.out.println("reviewSeq == "+ reviewSeq);
		System.out.println("comNum == "+ comNum);
		System.out.println("userId == "+ userId);
		hospitalReviewService.deleteHospitalReview(reviewSeq,comNum,userId);
		likeService.deleteLike(reviewSeq,comNum);
		
		return "redirect:/detailHospital?hospitalSeq="+hospitalSeq+"#review-start";
	}
	
	@RequestMapping("updateHospitalReview")
	public String updateHospitalReview(int reviewSeq, String userId, String comNum, String content, int hospitalSeq) {
		System.out.println("updateHospitalReview 들어옴");
//		System.out.println("reviewSeq == "+ reviewSeq);
//		System.out.println("userId == "+ userId);
//		System.out.println("comNum == "+ comNum);
//		System.out.println("content == "+ content);
//		System.out.println("hospitalSeq == "+ hospitalSeq);
		
		HospitalReviewVO hospitalReviewVO = new HospitalReviewVO();
		hospitalReviewVO.setReviewSeq(reviewSeq);
		hospitalReviewVO.setUserId(userId);
		hospitalReviewVO.setComNum(comNum);
		hospitalReviewVO.setContent(content);
		
		hospitalReviewService.updateHospitalReview(hospitalReviewVO);
		
		return "redirect:/detailHospital?hospitalSeq="+hospitalSeq+"#review-start";
	}
	
}
