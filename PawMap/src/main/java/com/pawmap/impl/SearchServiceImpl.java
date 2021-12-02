package com.pawmap.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.Criteria;
import com.pawmap.VO.HospitalVO;
import com.pawmap.mapper.SearchMapper;
import com.pawmap.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchMapper searchMapper;
	
	@Override
	public HospitalVO findHospitalData(String vo) {
		return searchMapper.findHospitalData(vo);
		
	}

	@Override
	public void insertHospitalData(HospitalVO vo) {

		searchMapper.insertHospitalData(vo);
		
	}
	
	@Override
	public List<HospitalVO> getHospitalList() {
		return searchMapper.getHospitalList();
	}
	@Override
	public List<HospitalVO> getHospitalList(Criteria cri) {
		return searchMapper.getHospitalList(cri);
	}
	
	@Override
	public List<HospitalVO> searchHospitalList(String value, Criteria cri) {
		
		return searchMapper.searchHospitalList(value, cri);
	}
	
	@Override
	public HospitalVO getHospital(HospitalVO vo) {

		return searchMapper.getHospital(vo);
	}
	
	@Override
	public int getHospitalCount() {

		return searchMapper.getHospitalCount();
	}
	
	@Override
	public List<HospitalVO> getListWithPaging(Criteria cri) {

		return searchMapper.getListWithPaging(cri);
	}

	@Override
	public int getSearchHospitalCount(String value) {
		return searchMapper.getSearchHospitalCount(value);
	}
}
