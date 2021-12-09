package com.pawmap.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.FileVO;
import com.pawmap.VO.HospitalVO;
import com.pawmap.VO.UserVO;
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
	public void deleteVetInfo(int vetSeq, int hospitalSeq)  {
		vetMapper.deleteVetInfo(vetSeq, hospitalSeq);
		
		
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

	@Override
	public HospitalVO getHospitalInfo(UserVO vo) {
		return vetMapper.getHospitalInfo(vo);
	}
	
	@Override
	public int getMaxVetSeq(int seq) {
		return vetMapper.getMaxVetSeq(seq);
	}
	
	@Override
	public List<VetVO> getVetListWithFiles(VetVO vo) {
		return vetMapper.getVetListWithFiles(vo);
	}
	
	
}