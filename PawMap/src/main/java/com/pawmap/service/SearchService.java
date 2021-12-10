package com.pawmap.service;

import java.util.List;
import java.util.Map;

import com.pawmap.VO.Criteria;
import com.pawmap.VO.HospitalVO;

public interface SearchService {

	
	public HospitalVO findHospitalData(String vo);
	
	public void insertHospitalData(HospitalVO vo);
	
	public List<HospitalVO> getHospitalList();
	
	public List<HospitalVO> getHospitalList(Criteria cri);
	
	public List<HospitalVO> searchHospitalList(String value, Criteria cri);

	public HospitalVO getHospital(HospitalVO vo);
	
	public int getHospitalCount();
	public int getSearchHospitalCount(String value);
	public List<HospitalVO> getListWithPaging(Criteria cri);
}
