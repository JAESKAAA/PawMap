package com.pawmap.service;

import java.util.List;

import com.pawmap.VO.FileVO;

public interface FileService {

	List<FileVO> getFileListByFreeBoardSeq(int boardSeq);
	
	void insertBoardFileList(List<FileVO> fileList);

}
