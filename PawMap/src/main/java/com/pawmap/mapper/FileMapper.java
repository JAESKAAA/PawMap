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

	void deleteOneFile(@Param("fileSeq")int fileSeq,@Param("boardSeq") int boardSeq);
	
	void insertPetFileList(FileVO vo);
	
	List<FileVO> getFileListByUserId(@Param("userId") String userId);

	void deletePetFile(@Param("petSeq") int petSeq);

	void updatePetFileList(FileVO fileList);

}
