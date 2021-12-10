package com.pawmap.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.CommentVO;
import com.pawmap.VO.Criteria;
import com.pawmap.mapper.BoardMapper;
import com.pawmap.service.BoardService;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;

	@Override
	public void insertFreeAndNanumBoard(BoardVO vo) {
		boardMapper.insertFreeAndNanumBoard(vo);
	}

	@Override
	public List<BoardVO> getFreeBoardList(BoardVO vo, Criteria cri) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("board", vo);
		cri.setStartNum((cri.getPageNum() -1 ) * cri.getAmount());
		paramMap.put("criteria", cri);
		
		return boardMapper.getFreeBoardList(paramMap);
	}

	@Override
	public BoardVO getFreeBoard(int boardSeq) {
		return boardMapper.getFreeBoard(boardSeq);
	}

	@Override
	public void deleteFreeBoardBySeq(int boardSeq) {
		boardMapper.deleteFreeBoardBySeq(boardSeq);
	}

	@Override
	public void updateFreeBoardForm(BoardVO vo) {
		boardMapper.updateFreeBoardForm(vo);
	}


	@Override
	public int selectBoardCount(BoardVO vo) {
		return boardMapper.selectBoardCount(vo);
	}

	@Override
	public void insertReplyForFreeBoard(CommentVO commentVO) {
		boardMapper.insertReplyForFreeBoard(commentVO);

	}


	@Override
	public List<HashMap<String, Object>> getLatelyBoardListForBoardMain() {
		
		return boardMapper.getLatelyBoardListForBoardMain();

	}

	@Override
	public int getFreeBoardSeq() {
		return boardMapper.getFreeBoardSeq();

	}

//	나눔게시판 리스트
	@Override
	public List<BoardVO> getNanumBoardList(BoardVO vo, Criteria cri) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("board", vo);
		cri.setStartNum((cri.getPageNum() -1 ) * cri.getAmount());
		paramMap.put("criteria", cri);
		
		return boardMapper.getNanumBoardList(paramMap);
	}

//	게시판 상세조회
	@Override
	public BoardVO getBoardDetail(int boardSeq, String boardType) {
		System.out.println("=============보드서비스찍히는지확인");
		System.out.println("getBoardDetail - boardSeq = " + boardSeq + " boardType = " + boardType);
		return boardMapper.getBoardDetail(boardSeq, boardType);
	}

	@Override
	public BoardVO getNanumBoard(int boardSeq) {
		System.out.println("(nanumboard) BoardServiceImpl 의 boardSeq ======"+boardSeq);
		return boardMapper.getNanumBoard(boardSeq);
	}

	@Override
	public void updateNanumBoardForm(BoardVO vo) {
		boardMapper.updateNanumBoardForm(vo);
		
	}
@Override
public int getNanumBoardSeq() {
	return boardMapper.getNanumBoardSeq();
}

@Override
public void deleteNanumBoardBySeq(int boardSeq) {
	boardMapper.deleteNanumBoardBySeq(boardSeq);
	
	
}

@Override
public List<HashMap<String, Object>> getLatelyBoardListForNanumBoardMain() {
	return boardMapper.getLatelyBoardListForNanumBoardMain();
}

@Override
public int selectNanumBoardCount(BoardVO vo) {
	return boardMapper.selectNanumBoardCount(vo);
}

@Override
public List<HashMap<String, Object>> getLatelyBoardListForShelterBoardMain() {
	return boardMapper.getLatelyBoardListForShelterBoardMain();
}
	

	@Override
	public void insertMedicalRecord(BoardVO vo) {
		boardMapper.insertMedicalRecord(vo);
	}

	@Override
	public List<BoardVO> getMyMedicalRecordListById(String userId) {
		return boardMapper.getMyMedicalRecordListById(userId);
	}

	@Override
	public List<BoardVO> getHospitalMedicalRecordList(String date, String comNum) {
		return boardMapper.getHospitalMedicalRecordList(date,comNum);
	}

	@Override
	public List<HashMap<String, Object>> getSeparateMedicalRecordForClient(String comNum, String reservationDate, String scheduleTime) {
		return boardMapper.getSeparateMedicalRecordForClient(comNum, reservationDate, scheduleTime);
	}

	@Override
	public int getMedicalBoardSeq() {
		return boardMapper.getMedicalBoardSeq();
		
	}

	@Override
	public void updateMedicalRecord(BoardVO vo) {
		boardMapper.updateMedicalRecord(vo);
	}

	@Override
	public List<BoardVO> getMyMedicalRecordForAllowReview(String userId, String hospitalComNum) {
		return boardMapper.getMyMedicalRecordForAllowReview(userId,hospitalComNum);
	}

	@Override
	public void updateFreeBoardCnt(int boardSeq) {
		boardMapper.updateFreeBoardCnt(boardSeq);
	}


}

