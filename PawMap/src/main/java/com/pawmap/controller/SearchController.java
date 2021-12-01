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
import com.pawmap.handler.OpenApiHandler;
import com.pawmap.mapper.SearchMapper;

@Controller
public class SearchController {

	@Autowired
	private OpenApiHandler apiHandler;
	
	@Autowired
	private SearchMapper searchMapper;
	
	@GetMapping("/search")
	public String showSearchPage( Model model , Criteria cri) {
		
		List<HospitalVO> hospitalList = searchMapper.getListWithPaging(cri);
		System.out.println("hospitalList 표출 : "+hospitalList.get(0) );
		System.out.println("hospitalList 갯수 : "+hospitalList.size());
		
		model.addAttribute("hospitalList", hospitalList);
		
		return "search_page";
	}
	
	@GetMapping("/searchDetail")
	public String showSearchDetail(@RequestParam String value, Model model) {
	
		System.out.println("벨류값 표출 "+value);
		
		List<HospitalVO> hospitalList = searchMapper.searchHospitalList(value);
		System.out.println("hospitalList 표출 : "+hospitalList.get(0));
		System.out.println("hospitalList 갯수 : "+hospitalList.size());
		
		model.addAttribute("hospitalList", hospitalList);
		return"search_page";
	}
	
	@GetMapping("/detailHospital")
	public String showDetailHospital(HospitalVO vo, Model model ) {
		HospitalVO hospital = searchMapper.getHospital(vo);
		
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
