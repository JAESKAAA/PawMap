package com.pawmap.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.pawmap.VO.PetVO;
import com.pawmap.VO.UserVO;

public interface PetService {

	void insertPetInfo(PetVO vo);

	PetVO selectPetInfo(PetVO petVO);
		
	public void updatePetInfo(PetVO vo);

	public List<Map<String, Object>>getPetList(PetVO vo);
	
	int getPetSeq(String userId);

	void deletePetInfo(int petSeq, String userId);

	
}