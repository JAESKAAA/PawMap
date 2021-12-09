package com.pawmap.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.PetVO;
import com.pawmap.VO.UserVO;
import com.pawmap.mapper.PetMapper;
import com.pawmap.service.PetService;

@Service
public class PetServiceImpl implements PetService {

	@Autowired
	private PetMapper petMapper;


	@Override
	public void insertPetInfo(PetVO vo) {
		petMapper.insertPetInfo(vo);
		
	}


	@Override
	public void deletePetInfo(int petSeq) throws Exception  {
		petMapper.deletePetInfo(petSeq);
		
		
	}


	@Override
	public PetVO selectPetInfo(PetVO vo) {
		return petMapper.selectPetInfo(vo);
	}



	@Override
	public void updatePetInfo(PetVO vo) {
		 petMapper.updatePetInfo(vo);		
	}


	@Override
	public List<Map<String, Object>> getPetList(PetVO vo) {
		return petMapper.getPetList(vo);
	}


	@Override
	public int getPetSeq(String userId) {
		
		return petMapper.getPetSeq(userId);
	}


	@Override
	public List<PetVO> getPetInfoList(String userId) {
		// TODO Auto-generated method stub
		return petMapper.getPetInfoList(userId);
	}



}