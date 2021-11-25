package com.pawmap.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.UserVO;
import com.pawmap.mapper.BoardMapper;
import com.pawmap.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;
	

	@Override
	public void insertTest(UserVO vo) {
		boardMapper.insertTest(vo);
	}

	@Override
	public void insertContent(BoardVO vo) {
		boardMapper.insertBoard(vo);
	}

//	�����Խ��� ����Ʈ
	@Override
	public List<BoardVO> getFreeBoardList() {
		System.out.println("================�����Խ��� ����Ʈ impl ����");
		return boardMapper.getFreeBoardList();
	}

//	�����Խ��� ����Ʈ
	@Override
	public List<BoardVO> getNanumBoardList() {
		System.out.println("================�����Խ��� ����Ʈ impl ����");
		return boardMapper.getNanumBoardList();
	}
	
	
//	�Խ��� ����ȸ
	@Override
	public BoardVO getBoardDetail(int boardSeq, String boardType) {
		System.out.println("=============���弭����������Ȯ��");
		System.out.println("getBoardDetail - boardSeq = " + boardSeq + " boardType = " + boardType);
		return boardMapper.getBoardDetail(boardSeq, boardType);
	}

//	�� ����
	@Override
	public BoardVO updateBoard(BoardVO vo) {
		System.out.println("========���� ���� Ÿ���� Ȯ��");
		boardMapper.updateBoard(vo);
		System.out.println(vo + "========���� ���� Ÿ�� �Ϸ�");
		return vo;
	}

//	�� ����
	@Override
	public void deleteBoard(BoardVO vo) {
		System.out.println("========���� ���� Ÿ���� Ȯ��");
		boardMapper.deleteBoard(vo);
		System.out.println(vo + "========���� ���� Ÿ�� �Ϸ�");
	}


}

