package com.pawmap.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.FileVO;
import com.pawmap.mapper.FileMapper;
import com.pawmap.service.FileService;

@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	private FileMapper fileMapper;

	@Override
	public List<FileVO> getFileListByFreeBoardSeq(int boardSeq) {

		return fileMapper.getFileListByFreeBoardSeq(boardSeq);
	}

	@Override
	public void insertBoardFileList(List<FileVO> fileList) {
		for(FileVO vo : fileList) {
			fileMapper.insertBoardFileList(vo);
			System.out.println(vo.getBoardSeq());

		}
	}

	@Override
	public void deleteFileByBoardSeq(int boardSeq) {
		fileMapper.deleteFileByBoardSeq(boardSeq);
	}
	
	@Override
	public void deleteFileByBoardSeqOnShelterSeq(int boardSeq) {
		fileMapper.deleteFileByBoardSeqOnShelterSeq(boardSeq);
	}

	@Override
	public void deleteOneFile(int fileSeq, int boardSeq) {
		fileMapper.deleteOneFile(fileSeq, boardSeq);
	}

	@Override
	public void deleteTargetFile(FileVO vo) {
		fileMapper.deleteTargetFile(vo);
	}

	@Override
	public void insertUpdateOneFile(FileVO vo) {
		fileMapper.insertUpdateOneFile(vo);
	}

	@Override
	public List<FileVO> getFileListBySeqType(int boardSeq, String boardType) {
		return fileMapper.getFileListBySeqType(boardSeq, boardType);
	}

	@Override
	public List<FileVO> getFileListByNanumBoardSeq(int boardSeq) {
		return fileMapper.getFileListByNanumBoardSeq(boardSeq);
	}

	
}
