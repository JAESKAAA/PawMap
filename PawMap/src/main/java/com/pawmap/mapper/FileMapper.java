package com.pawmap.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.FileVO;

@Mapper
public interface FileMapper {

	List<FileVO> getFileListByFreeBoardSeq(@Param("boardSeq") int boardSeq);
	
	void insertBoardFileList(FileVO vo);

	void deleteFileByBoardSeq(@Param("boardSeq") int boardSeq);

	// 글삭제시 파일삭제 같이되는용도
	void deleteFileByBoardSeqOnShelterSeq(int boardSeq);
	
	// 소스 안꼬이도록 임시통합 (파일삭제관련)
	void deleteOneFile(@Param("fileSeq")int fileSeq,@Param("boardSeq") int boardSeq);

	// 글과 매핑되는 파일 리스트 리턴해줌
	List<FileVO> getFileListBySeqType(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);
	
	// file 테이블에 pk값 존재 시 update / 없으면 insert (구현실패로 쓰지않음)
	void insertUpdateOneFile(FileVO vo);

	// file 테이블에서 pk값에 매칭되는 row  삭제 (구현실패로 쓰지않음)
	void deleteTargetFile(FileVO vo);

	List<FileVO> getFileListByNanumBoardSeq(@Param("boardSeq") int boardSeq);

}
