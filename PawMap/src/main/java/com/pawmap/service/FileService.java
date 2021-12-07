package com.pawmap.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.FileVO;

public interface FileService {

	List<FileVO> getFileListByFreeBoardSeq(int boardSeq);
	
	List<FileVO> getFileListBySeqType(int boardSeq, String boardType);
	
	void insertBoardFileList(List<FileVO> fileList);

	void deleteFileByBoardSeq(int boardSeq);

	void deleteOneFile(int fileSeq, int boardSeq);

	void deleteTargetFile(FileVO vo);

	void insertUpdateOneFile(FileVO vo);

	void deleteFileByBoardSeqOnShelterSeq(int boardSeq);
	
	//나눔게시판 파일리스트 불러오는 메소드
	List<FileVO> getFileListByNanumBoardSeq(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);

	void insertNanumBoardFileList(FileVO fileVO);

	void deleteFileByBoardSeqOnNanumSeq(int boardSeq);

	List<FileVO> getFileListByShelterSeq(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);

	void insertShelterFileList(List<FileVO> fileList);

}
