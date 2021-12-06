package com.pawmap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.PetVO;



@Mapper
public interface PetMapper {

	int getPetSeq();

	/*펫 정보 글 생성 */
	void insertPetInfo(PetVO vo);
  
	/*펫 정보 조회.. 펫 등록 페이지에서 표출*/
	PetVO selectPetInfo(PetVO petVO);

	/*펫 정보 수정*/
	public void updatePetInfo(PetVO vo);
  
	/*펫 상태정보 변경,,*/
	public void deletePetInfo(int petSeq) throws Exception;
	
	public List<PetVO>getPetList(PetVO vo);
	




	//public List<BoardDTO> selectBoardList();
  /** 상태값 유효한 정보 개수 확인, 페이징 처리에 사용
	public int selectBoardTotalCount();
  **/
}