package com.pawmap.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.Criteria;
import com.pawmap.VO.HospitalVO;
import com.pawmap.VO.PageVO;
import com.pawmap.VO.VetVO;
import com.pawmap.configuration.auth.PrincipalDetails;
import com.pawmap.handler.OpenApiHandler;
import com.pawmap.service.BoardService;
import com.pawmap.service.HospitalReviewService;
import com.pawmap.service.SearchService;
import com.pawmap.service.VetService;

@Controller
public class SearchController {

	@Autowired
	private OpenApiHandler apiHandler;
	
	@Autowired
	private VetService vetService;
	
	@Autowired
	private SearchService searchSearvice;
	
	@Autowired
	private HospitalReviewService hospitalReviewService;
	
	@Autowired
	private BoardService boardService;
	
	
	@GetMapping("/search")
	public String showSearchPage(Model model , Criteria cri) {
		

		List<HospitalVO> hospitalList = searchSearvice.getHospitalList();
		
		if(hospitalList != null) {
			System.out.println("hospitalList 담긴 거 = "+hospitalList.get(0) );
			System.out.println("hospitalList 총 갯수= "+hospitalList.size());
			}
		
		
		model.addAttribute("hospitalList", hospitalList);
		
		return "search_page";
	}
	
	@GetMapping("/searchDetail")
	public String showSearchDetail(@RequestParam String value, Model model, Criteria cri) {
	
		
		System.out.println("벨류값 표출 "+value);
		//요청받은 pageNum 기준으로 offset값을 amout단위로 늘려줌
		cri.setStartNum((cri.getPageNum()-1)*cri.getAmount());
		System.out.println("수정 후 cri 값 : "+cri);
		List<HospitalVO> hospitalList = searchSearvice.searchHospitalList(value, cri);
		
		int total = searchSearvice.getSearchHospitalCount(value);
		
		if(hospitalList.size() != 0) {
		System.out.println("hospitalList 담긴 거 = "+hospitalList.get(0) );
		System.out.println("hospitalList 총 갯수= "+hospitalList.size());
		}
		
		model.addAttribute("hospitalList", hospitalList);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		model.addAttribute("value",value);
		return"search_page";
	}
	
	@GetMapping("/detailHospital")
	public String showDetailHospital(HospitalVO vo, Authentication authentication, Model model ) {
		HospitalVO hospital = searchSearvice.getHospital(vo);
		

		//	병원 리뷰 리스트
		List<HashMap<String,Object>> hospitalReviewList = hospitalReviewService.getHospitalReviewList(hospital.getHospitalComNum());
		
		//	로그인한 유저 아이디가지고 오려는 로직, 
		if(authentication == null) {
			System.out.println("비회원");
		}else {
			PrincipalDetails PrincipalDetails = (PrincipalDetails) authentication.getPrincipal();
			String userId = PrincipalDetails.getUser().getUserId();
			//	로그인한 유저의 아이디와 병원 상세페이지에서의 병원 comnum 정보를 가지고 해당 유저가 그 병원에서 진단서를 받은적이 있는지 확인
			//	진단서가 있다면 리뷰를 달수 잇게끔 처리할것이다.
			List<BoardVO> myResList = boardService.getMyMedicalRecordForAllowReview(userId,hospital.getHospitalComNum());
			model.addAttribute("myResList",myResList);
			System.out.println("userId ==="+userId);
			System.out.println("myResList ==="+myResList);
		}

		System.out.println("특정 hospital 정보 출력 : " +hospital);
		
		model.addAttribute("hospitalReviewList",hospitalReviewList);
		model.addAttribute("reviewSize",hospitalReviewList.size());

		VetVO vet = new VetVO();
		vet.setHospitalSeq(vo.getHospitalSeq());
		vet.setUserId(hospital.getHospitalId());
		
		
		List<VetVO> vetList = vetService.getVetListWithFiles(vet);
		System.out.println("특정 hospital 정보 출력 : " +hospital);
		System.out.println("vetList --> "+vetList);

		model.addAttribute("hospital", hospital);
		model.addAttribute("vetList", vetList);
		return "hospital-detail";
	}
	
	/**
	 * @author 재석
	 * @apiNote 공공 API 호출하는 메소드입니다. DB에 많은양의 데이터가 쌓이니 사용하실때 주의 !!
	 */
	//DB에 데이터 넣어주는 메소드로 DB조작 하는 건 아니면 사용 금지 !!
	@GetMapping("/getGangnamList")
	public String getGangnamList( ) throws IOException, Exception {
		
		apiHandler.handleHospitalInfo();
		
		return "search_page";
		
	}
	
	@GetMapping("/hospital")
	public String showHospitalPage() {
		return "hospital-detail";
	}
}
