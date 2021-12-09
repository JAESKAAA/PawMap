package com.pawmap.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.VetVO;
import com.pawmap.mapper.VetMapper;
import com.pawmap.service.VetService;



@Service
public class VetServiceImpl implements VetService {

	@Autowired
	private VetMapper vetMapper;


	@Override
	public void insertVetInfo(VetVO vo) {
		vetMapper.insertVetInfo(vo);
		
	}


	@Override
	public void deleteVetInfo(int vetSeq) throws Exception  {
		vetMapper.deleteVetInfo(vetSeq);
		
		
	}


	@Override
	public VetVO selectVetInfo(VetVO vo) {
		return vetMapper.selectVetInfo(vo);
	}



	@Override
	public void updateVetInfo(VetVO vo) {
		 vetMapper.updateVetInfo(vo);		
	}


	@Override
	public List<VetVO> getVetList(VetVO vo) {
		return vetMapper.getVetList(vo);
	}


	@Override
	public int getVetSeq() {
		
		return vetMapper.getVetSeq();
	}



}