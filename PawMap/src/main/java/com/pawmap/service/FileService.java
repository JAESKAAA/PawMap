package com.pawmap.service;

import java.util.List;


import com.pawmap.VO.FileVO;

public interface FileService {

	List<FileVO> getFileListByFreeBoardSeq(int boardSeq);
	
	List<FileVO> getFileListByNanumBoardSeq(int boardSeq);

	List<FileVO> getFileListBySeqType(int boardSeq, String boardType);
	
	void insertBoardFileList(List<FileVO> fileList);

	void deleteFileByBoardSeq(int boardSeq);

	void deleteOneFile(int fileSeq, int boardSeq);

	void deleteTargetFile(FileVO vo);

	void insertUpdateOneFile(FileVO vo);

	void deleteFileByBoardSeqOnShelterSeq(int boardSeq);

	
}
