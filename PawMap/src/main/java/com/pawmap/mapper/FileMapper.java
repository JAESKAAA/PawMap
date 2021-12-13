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
	
	// Nanum board 글삭제시 파일삭제 같이되는용도
	void deleteFileByBoardSeqOnNanumSeq(int boardSeq);

	// Shelter 글삭제시 파일삭제 같이되는용도
	void deleteFileByBoardSeqOnShelterSeq(int boardSeq);
	
	// 소스 안꼬이도록 임시통합 (파일삭제관련)
	void deleteOneFile(@Param("fileSeq")int fileSeq,@Param("boardSeq") int boardSeq);

	// 글과 매핑되는 파일 리스트 리턴해줌
	List<FileVO> getFileListBySeqType(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);
	
	// file 테이블에 pk값 존재 시 update / 없으면 insert (구현실패로 쓰지않음)
	void insertUpdateOneFile(FileVO vo);

	// file 테이블에서 pk값에 매칭되는 row  삭제 (구현실패로 쓰지않음)
	void deleteTargetFile(FileVO vo);

	//나눔게시판 파일리스트 불러오는 메소드 (시퀀스로)
	List<FileVO> getFileListByNanumBoardSeq(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);

	// 나눔게시판 파일 인서트 관련 메소드
	void insertNanumBoardFileList(FileVO fileVO);
	
	
	List<FileVO> getFileListByShelterSeq(@Param("boardSeq") int boardSeq, @Param("boardType") String boardType);
	
	void insertShelterFileList(FileVO vo);

	
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

		void deleteNanumFile(@Param("fileSeq") int fileSeq, @Param("boardSeq") int boardSeq);

		void deleteShelterFile(@Param("fileSeq") int fileSeq, @Param("boardSeq") int boardSeq);

}
