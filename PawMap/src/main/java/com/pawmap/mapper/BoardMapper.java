package com.pawmap.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.CommentVO;
import com.pawmap.VO.UserVO;


@Mapper
public interface BoardMapper {

	

	int insertTest(UserVO vo);


	void insertFreeAndNanumBoard(BoardVO vo);

	List<BoardVO> getFreeBoardList(Map<String,Object> map);

	BoardVO getFreeBoard(@Param("boardSeq") int boardSeq);

	void deleteFreeBoardBySeq(@Param("boardSeq") int boardSeq);

	void updateFreeBoardForm(BoardVO vo);

	int selectBoardCount(BoardVO vo);

	void insertReplyForFreeBoard(CommentVO commentVO);


	int getFreeBoardSeq();

	List<HashMap<String, Object>> getLatelyBoardListForBoardMain();


//	나눔게시판
	List<BoardVO> getNanumBoardList(Map<String, Object> map);

//	글 상세조회
	BoardVO getBoardDetail(@Param ("boardSeq") int boardSeq, @Param ("boardType") String boardType);


	BoardVO getNanumBoard(@Param("boardSeq") int boardSeq);


	void updateNanumBoardForm(BoardVO vo);
	
 	int getNanumBoardSeq();

	void deleteNanumBoardBySeq(@Param("boardSeq") int boardSeq);


	List<HashMap<String, Object>> getLatelyBoardListForNanumBoardMain();


	int selectNanumBoardCount(BoardVO vo);


	List<HashMap<String, Object>> getLatelyBoardListForShelterBoardMain();



	void insertMedicalRecord(BoardVO vo);


	List<BoardVO> getMyMedicalRecordListById(String userId);


	List<BoardVO> getHospitalMedicalRecordList(@Param("date")String date,@Param("comNum") String comNum);


	List<HashMap<String, Object>> getSeparateMedicalRecordForClient(@Param("comNum")String comNum,@Param("reservationDate") String reservationDate,@Param("scheduleTime") String scheduleTime);


	int getMedicalBoardSeq();


	void updateMedicalRecord(BoardVO vo);


	List<BoardVO> getMyMedicalRecordForAllowReview(@Param("userId")String userId,@Param("hospitalComNum") String hospitalComNum);


	void updateFreeBoardCnt(@Param("boardSeq")int boardSeq);


	//관리자 페이지에서 community 게시판 부를때 사용하는 메소드
	List<BoardVO> getCommunityBoardList(Map<String,Object> map);
	
	List<HashMap<String, Object>> getLatelyCommunityBoardListForBoardMain();	
	
//	=====================================================================
	
	List<HashMap<String, Object>> getLatelyBoardListForShelterBoardMain
	(@Param("boardSeq") int boardSeq);

}

