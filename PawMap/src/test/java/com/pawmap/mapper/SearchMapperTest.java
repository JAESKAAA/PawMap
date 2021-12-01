package com.pawmap.mapper;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pawmap.VO.Criteria;
import com.pawmap.VO.HospitalVO;

import lombok.extern.log4j.Log4j2;

@SpringBootTest
@Log4j2
class SearchMapperTest {

	@Autowired
	private SearchMapper searchMapper;
	
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
		List<HospitalVO> list = searchMapper.getListWithPaging(cri);
		
		list.forEach(b -> log.info(b));
	
	}
	
	@Test
	@DisplayName("검색어 테스트")
	public void searchHospitalListTest() {
		
		List<HospitalVO> list = searchMapper.searchHospitalList("신림");
		
		list.forEach(s->log.info(s));
		log.info("토탈갯수"+list.size());
	}
}
