package com.pawmap.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pawmap.VO.HospitalVO;
import com.pawmap.mapper.SearchMapper;

@Service
public class SearchServiceImpl implements SearchMapper {

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
	public List<HospitalVO> getHospitalList(HospitalVO vo) {

		return searchMapper.getHospitalList(vo);
	}
	
	@Override
	public List<HospitalVO> searchHospitalList(String value) {
		return searchMapper.searchHospitalList(value);
	}
	
	@Override
	public HospitalVO getHospital(HospitalVO vo) {
		return searchMapper.getHospital(vo);
	}

}
