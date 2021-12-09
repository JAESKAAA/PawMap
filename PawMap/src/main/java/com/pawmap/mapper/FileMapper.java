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

	void deletePetFile(@Param("petSeq")int petSeq,@Param("userId") String userId);

	void updatePetFileList(FileVO fileList);

	void insertMedicalFileList(FileVO vo);

	List<FileVO> getFileListByMedicalBoardSeq(int boardSeq);

	void deleteOneFileOnMedicalRecord(@Param("fileSeq")int fileSeq, @Param("boardSeq") int boardSeq);

	void insertUserProfile(FileVO vo);

	void deleteProfile(@Param("userSeq") int userSeq,@Param("boardType") String userType,@Param("userId") String userId);

	FileVO getPetFile(@Param("petSeq")int petSeq,@Param("userId") String userId);

	void insertPetFileOnUpdateForm(FileVO vo);

	public void insertVetFileList(FileVO vo);

	void updateVetFileList(FileVO vo);

	//기존 파일정보 가져오기위한 메서드
		public FileVO vetInfoFile(FileVO vo);

		public void deleteVetFile(@Param("vetSeq")int vetSeq, @Param("boardType")String boardType, @Param("userId")String userId);




}
