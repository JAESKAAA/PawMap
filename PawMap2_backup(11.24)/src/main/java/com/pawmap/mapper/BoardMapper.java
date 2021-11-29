package com.pawmap.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.pawmap.VO.BoardVO;


@Mapper
public interface BoardMapper {

	void insertBoard(BoardVO vo);
}