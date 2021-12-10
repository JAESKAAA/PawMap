package com.pawmap.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.ShelterVO;
import com.pawmap.mapper.ShelterMapper;
import com.pawmap.service.ShelterService;

/*
 * @Controller, @Service, @Repository
 * 상기 어노테이션들 모두 Bean 객체 생성이라는 동일한 기능을 함
 * 다만, 명시적으로 각각의 기능을 나타내 주기 위해 구분해서 사용함
 * @Controller : Presentation Layer (웹 요청과 응답을 처리함)
 * @Service : Service Layer (내부에서 자바 로직을 처리함)
 * @Repository : Persistence Layer (DB나 파일과 같은 외부 I/O작업을 처리함)
 * */
@Service
public class ShelterServiceImpl implements ShelterService{
	
	@Autowired 
	private ShelterMapper shelterMapper;
	
	
//	관리자 페이지 -> 보호소 관리 페이지로 이동할때 shelterList 받아오기 관련
	@Override
	public List<ShelterVO> getShelterList(ShelterVO vo) {
		return shelterMapper.getShelterList(vo);
		
	}
	
//	---------------------------------------------------------------------
	@Override
	public int getShelterSeq() {
		return shelterMapper.getShelterSeq();
	}
	@Override
	public void insertShelterForm(ShelterVO vo) {
		shelterMapper.insertShelterForm(vo);
		
//		--------------------------------------------------------------------
		
	}
	@Override
	public void updateShelterForm(ShelterVO vo) {
		shelterMapper.updateShelterForm(vo);
		
	}
	@Override
	public Map<String, String> getShelter(int shelterSeq) {
		System.out.println("shelterServiceImpl의 shelterSeq ===============" + shelterSeq);
		return shelterMapper.getShelter(shelterSeq);
	}
	@Override
	public void deleteShelterForm(int shelterSeq) {
		shelterMapper.deleteShelterFormBySeq(shelterSeq);
		
	}
	@Override
	public ShelterVO getShelterList(int shelterSeq) {
		System.out.println("BoardServiceImpl 의 shelterSeq ======"+shelterSeq);
		return shelterMapper.getShelterList(shelterSeq);
	}
	
}
