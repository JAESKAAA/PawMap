package com.pawmap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.ShelterVO;

@Mapper
public interface ShelterMapper {
	// 보호소 관련 메소드들
	// 밑에부분 은혜 추가 문제있을시 은혜한테 말하기
	// 관리자 페이지 -> 보호소 관리 페이지로 이동할때 shelterList 받아오는 메소드
	public List<ShelterVO> getShelterList(ShelterVO vo);
	
	int getShelterSeq();

	void insertShelterForm(ShelterVO vo);

	void updateShelterForm(ShelterVO vo);
	
	void deleteShelterForm(ShelterVO vo);

	Map<String, String> getShelter(@Param("shelterSeq") int shelterSeq);

	void deleteShelterFormBySeq(@Param("shelterSeq") int shelterSeq);

	public ShelterVO getShelterList(@Param("shelterSeq") int shelterSeq);






}
