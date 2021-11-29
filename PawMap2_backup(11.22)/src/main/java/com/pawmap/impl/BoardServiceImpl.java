package com.pawmap.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}

