package com.pawmap.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.BoardVO;
import com.pawmap.mapper.BoardMapper;
import com.pawmap.service.BoardService;





/*
 * @Controller, @Service, @Repository
 * ��� ������̼ǵ� ��� Bean ��ü �����̶�� ������ ����� ��
 * �ٸ�, ��������� ������ ����� ��Ÿ�� �ֱ� ���� �����ؼ� �����
 * @Controller : Presentation Layer (�� ��û�� ������ ó����)
 * @Service : Service Layer (���ο��� �ڹ� ������ ó����)
 * @Repository : Persistence Layer (DB�� ���ϰ� ���� �ܺ� I/O�۾��� ó����)
 * */
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	

	@Override
	public void insertBoard(BoardVO vo) {
		boardMapper.insertBoard(vo);
	}
}

