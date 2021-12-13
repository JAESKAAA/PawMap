package com.pawmap.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pawmap.VO.LikeVO;
import com.pawmap.service.LikeService;

@Controller
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	@RequestMapping(value = "/clickLike", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String insertLike(@RequestBody Map<String,String> map) throws JsonProcessingException {
		
		System.out.println(map);
		int reviewSeq = Integer.parseInt(map.get("reviewSeq"));
		String comNum = map.get("comNum");
		String userId = map.get("userId");
		
		LikeVO vo = new LikeVO();
		vo.setReviewSeq(reviewSeq);
		vo.setComNum(comNum);
		vo.setUserId(userId);
		
		LikeVO checkVO = likeService.checkUserId(vo);
		System.out.println("checkVO ======== "+checkVO );
		
		ObjectMapper mapper = new ObjectMapper();
		
		String json = "";
		
		//	좋아요 한적이 없으면 인서트 시키고 새로운 상태값의 좋아요 리스트를 json으로 리턴
		if(checkVO == null) {
			System.out.println("checkVO 의 값은 널");
			likeService.insertLike(vo);		
			
			List<LikeVO> newStatusLikeList = likeService.getNewStatusLikeList(comNum);
			System.out.println("newStatusLikeList == "+ newStatusLikeList);
			
			
			
			json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(newStatusLikeList);
			
			System.out.println("json ==== "+json);
			
			return json;
			
		}
		
		if(checkVO.getLikeCheck() == 1) {
			
			likeService.disCountLike(checkVO);
			
			List<LikeVO> newStatusLikeList = likeService.getNewStatusLikeList(comNum);
			System.out.println("newStatusLikeList == "+ newStatusLikeList);
			
			json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(newStatusLikeList);
			
			System.out.println("json ==== "+json);
			
			return json;
			
		}
		
		if(checkVO.getLikeCheck() == 0) {
			
			likeService.updateIncreaseCountLike(checkVO);
			
			List<LikeVO> newStatusLikeList = likeService.getNewStatusLikeList(comNum);
			System.out.println("newStatusLikeList == "+ newStatusLikeList);
			
			json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(newStatusLikeList);
			
			System.out.println("json ==== "+json);
			
			return json;
			
		}
		
		//	좋아요 한적이 있으면 1의 값을 리턴
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("1", 1);
		
		json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(result);
		
		return json;
		
	}
	
}
