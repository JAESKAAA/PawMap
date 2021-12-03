package com.pawmap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.Criteria;
import com.pawmap.VO.HospitalVO;

@Mapper
public interface SearchMapper {

	public HospitalVO findHospitalData(String vo);
	
	public void insertHospitalData(HospitalVO vo);
	
	public List<HospitalVO> getHospitalList();
	
	public List<HospitalVO> getHospitalList(Criteria cri);
	
	public List<HospitalVO> searchHospitalList(@Param("value") String value, @Param("criteria") Criteria cri);
	
	public HospitalVO getHospital(HospitalVO vo);

	public List<HospitalVO> getListWithPaging(Criteria cri);
	
	public int getSearchHospitalCount(String value);
	
	public int getHospitalCount();
}
