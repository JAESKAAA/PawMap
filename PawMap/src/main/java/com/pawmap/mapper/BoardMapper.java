package com.pawmap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.BoardVO;

import com.pawmap.VO.CommentVO;

import com.pawmap.VO.UserVO;


@Mapper
public interface BoardMapper {

<<<<<<< HEAD

	int insertTest(UserVO vo);
=======
>>>>>>> a818a5e80c6aba8eddd3e5c7a22a607eaaa4ceef

	void insertFreeAndNanumBoard(BoardVO vo);

	List<BoardVO> getFreeBoardList(Map<String,Object> map);

	BoardVO getFreeBoard(@Param("boardSeq") int boardSeq);

	void deleteFreeBoardBySeq(@Param("boardSeq") int boardSeq);

	void updateFreeBoardForm(BoardVO vo);

	int selectBoardCount(BoardVO vo);


	void insertReplyForFreeBoard(CommentVO commentVO);

}

