package com.pawmap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.pawmap.VO.HospitalVO;

@Mapper
public interface SearchMapper {

	public HospitalVO findHospitalData(String vo);
	
	public void insertHospitalData(HospitalVO vo);
	
	public List<HospitalVO> getHospitalList(HospitalVO vo);
	
	List<HospitalVO> searchHospitalList(@RequestParam String value);
	
	HospitalVO getHospital(HospitalVO vo);


}
