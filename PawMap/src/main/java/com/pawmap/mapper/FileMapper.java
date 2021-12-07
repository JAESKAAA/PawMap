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

	void insertMedicalFileList(FileVO vo);

	List<FileVO> getFileListByMedicalBoardSeq(int boardSeq);

	void deleteOneFileOnMedicalRecord(@Param("fileSeq")int fileSeq, @Param("boardSeq") int boardSeq);

	void insertUserProfile(FileVO vo);

	void deleteProfile(@Param("userSeq") int userSeq,@Param("boardType") String userType,@Param("userId") String userId);

	

	


}
