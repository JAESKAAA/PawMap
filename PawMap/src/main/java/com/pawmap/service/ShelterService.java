package com.pawmap.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.pawmap.VO.ShelterVO;
import com.pawmap.VO.UserVO;

@Component
public interface ShelterService {

	// 관리자 페이지 -> 보호소 관리 페이지로 이동할때 shelterList 받아오는 메소드
	public List<ShelterVO> getShelterList(ShelterVO vo);
	
//	------------------------------------
	int getShelterSeq();
	
	void insertShelterForm(ShelterVO vo);
	void updateShelterForm(ShelterVO vo);
	public void deleteShelterForm(int shelterSeq);
	Map<String, String> getShelter(int shelterSeq);
	public ShelterVO getShelterList(int shelterSeq);
	
}
