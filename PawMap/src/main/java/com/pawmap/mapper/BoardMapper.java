package com.pawmap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.BoardVO;
import com.pawmap.VO.CommentVO;

<<<<<<< HEAD
=======
import com.pawmap.VO.FileVO;

import com.pawmap.VO.UserVO;

>>>>>>> 875d0942867d0b227aa30f8a55159abf263e7c76

@Mapper
public interface BoardMapper {


	int insertTest(UserVO vo);


	void insertFreeAndNanumBoard(BoardVO vo);

	List<BoardVO> getFreeBoardList(Map<String,Object> map);

	BoardVO getFreeBoard(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);

	void deleteFreeBoardBySeq(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);

	void updateFreeBoardForm(BoardVO vo);

	int selectBoardCount(BoardVO vo);

	void insertReplyForFreeBoard(CommentVO commentVO);

<<<<<<< HEAD
//	나눔게시판 - 은혜 추가
	List<BoardVO> getNanumBoardList(Map<String,Object> map);

=======

	int getFreeBoardSeq();
>>>>>>> 875d0942867d0b227aa30f8a55159abf263e7c76

}

