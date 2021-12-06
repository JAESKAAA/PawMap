package com.pawmap.service;

import java.util.List;

import com.pawmap.VO.FileVO;

public interface FileService {

	List<FileVO> getFileListByFreeBoardSeq(int boardSeq);
	
	void insertBoardFileList(List<FileVO> fileList);

	void deleteFileByBoardSeq(int boardSeq);

	void deleteOneFile(int fileSeq, int boardSeq);

	void insertPetFileList(List<FileVO> fileList);

	List<FileVO> getFileListByUserId(String userId);

	void deletePetFile(int parseInt);

	void updatePetFileList(List<FileVO> fileList);

}
