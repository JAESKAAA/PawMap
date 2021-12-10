package com.pawmap.mapper;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pawmap.VO.Criteria;
import com.pawmap.VO.HospitalVO;
import com.pawmap.VO.PageVO;
import com.pawmap.service.SearchService;

import lombok.extern.log4j.Log4j2;

@SpringBootTest
@Log4j2
class SearchMapperTest {

	@Autowired
	private SearchMapper searchMapper;
	@Autowired
	private SearchService searchService;
	
	@Test
	@DisplayName("병원정보 가져오는지 테스트")
	void getHospitalTest() {
		//준비
		HospitalVO vo = new HospitalVO();
		vo.setHospitalSeq(5);
		
		HospitalVO hospital= searchMapper.getHospital(vo);
		log.info(hospital);
		
	}

	@Test
	@DisplayName("페이징 테스트")
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setStartNum(10);
		List<HospitalVO> list = searchMapper.getListWithPaging(cri);
		
		list.forEach(b -> log.info(b));
	
	}
	
	@Test
	@DisplayName("검색어 테스트")
	public void searchHospitalListTest() {
		Criteria cri = new Criteria(); //현재 설정된 값은 1페이지에 11개

		List<HospitalVO> list = searchService.searchHospitalList("신림", cri);
		
		list.forEach(s->log.info(s));
		log.info("토탈갯수"+list.size());
	}
	
	@Test
	@DisplayName("페이징테스트 2")
	public void testPageVO() {
		Criteria cri = new Criteria(); //현재 설정된 값은 1페이지에 11개
		cri.setPageNum(25);
		PageVO pageVO = new PageVO(cri, 310);
		
		log.info(pageVO);
	}
}
