package com.pawmap.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.pawmap.VO.Criteria;
import com.pawmap.VO.HospitalVO;

public interface SearchService {

	
	List<HospitalVO> getFreeBoardList(HospitalVO vo, Criteria cri);

	List<HospitalVO> searchHospitalList(@RequestParam String value);

	HospitalVO getHospital(HospitalVO vo);
	
	
}
