package com.pawmap.service;

import java.util.List;

import org.springframework.ui.Model;

import com.pawmap.VO.PetVO;
import com.pawmap.VO.UserVO;

public interface PetService {

	void insertPetInfo(PetVO vo);

	PetVO selectPetInfo(PetVO petVO);
		
	public void deletePetInfo(int petSeq) throws Exception;

	public void updatePetInfo(PetVO vo);

	public List<PetVO>getPetList(PetVO vo);
	
	int getPetSeq();

	
}