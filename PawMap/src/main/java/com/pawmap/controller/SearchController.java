package com.pawmap.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pawmap.VO.Criteria;
import com.pawmap.VO.HospitalVO;
import com.pawmap.VO.PageVO;
import com.pawmap.handler.OpenApiHandler;
import com.pawmap.mapper.SearchMapper;
import com.pawmap.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private OpenApiHandler apiHandler;
	
	@Autowired
	private SearchService searchSearvice;
	
	
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
	public String showDetailHospital(HospitalVO vo, Model model ) {
		HospitalVO hospital = searchSearvice.getHospital(vo);
		
		System.out.println("특정 hospital 정보 출력 : " +hospital);
		model.addAttribute("hospital", hospital);
		
		return "hospital-detail";
	}
	
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
