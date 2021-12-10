package com.pawmap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.FileVO;
import com.pawmap.VO.HospitalVO;
import com.pawmap.VO.UserVO;
import com.pawmap.VO.VetVO;




@Mapper
public interface VetMapper {

	int getVetSeq();

	/*수의사 정보 생성 */
	void insertVetInfo(VetVO vo);
  
	/*수의사 정보 조회.. 수의사 등록 페이지에서 표출*/
	VetVO selectVetInfo(VetVO vetVO);

	/*수의사 정보 수정*/
	public void updateVetInfo(VetVO vo);
  
	/*수의사 삭제*/
	public void deleteVetInfo(@Param("vetSeq")int vetSeq, @Param("hospitalSeq")int hospitalSeq);
	
	/*수의사 리스트*/
	public List<VetVO>getVetList(VetVO vo);
	
	//병원정보 가져오는 메서드
	public HospitalVO getHospitalInfo(UserVO vo);

	int getMaxVetSeq(int seq);
	
	public List<VetVO> getVetListWithFiles(VetVO vo);



	//public List<BoardDTO> selectBoardList();
  /** 상태값 유효한 정보 개수 확인, 페이징 처리에 사용
	public int selectBoardTotalCount();
  **/
}