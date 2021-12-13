package com.pawmap.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.FileVO;

public interface FileService {

	List<FileVO> getFileListByFreeBoardSeq(int boardSeq);
	
	List<FileVO> getFileListBySeqType(int boardSeq, String boardType);
	
	void insertBoardFileList(List<FileVO> fileList);

	void deleteFileByBoardSeq(int boardSeq);

	void insertUpdateOneFile(FileVO vo);

	void deleteFileByBoardSeqOnShelterSeq(int boardSeq);
	
	//나눔게시판 파일리스트 불러오는 메소드
	List<FileVO> getFileListByNanumBoardSeq(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);

	void insertNanumBoardFileList(FileVO fileVO);

	void deleteFileByBoardSeqOnNanumSeq(int boardSeq);

	List<FileVO> getFileListByShelterSeq(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);

	void insertShelterFileList(List<FileVO> fileList);

	void insertPetFileList(List<FileVO> fileList);

	List<FileVO> getFileListByUserId(String userId);

	void deletePetFile(int petSeq, String userId);

	void updatePetFileList(List<FileVO> fileList);

	void insertMedicalFileList(List<FileVO> fileList);

	List<FileVO> getFileListByMedicalBoardSeq(int boardSeq);

	void deleteOneFileOnMedicalRecord(int fileSeq, int boardSeq);

	void insertUserProfile(List<FileVO> fileList);

	void deleteProfile(int userSeq, String userType, String userId);

	FileVO getPetFile(int petSeq, String userId);

	void insertPetFileOnUpdateForm(List<FileVO> fileList);

	public void insertVetFileList(List<FileVO> fileList);

	void updateVetFileList(List<FileVO> fileList);

	//기존 파일정보 가져오기위한 메서드
	public FileVO vetInfoFile(FileVO vo);

	public void deleteVetFile(int vetSeq, String boardType, String userId);

	void deleteOneFile(int fileSeq, int boardSeq);

	void deleteNanumFile(int fileSeq, int boardSeq);

	void deleteShelterFile(int fileSeq, int boardSeq);
	
}
