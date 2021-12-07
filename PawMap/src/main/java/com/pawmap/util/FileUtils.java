package com.pawmap.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pawmap.VO.FileVO;



public class FileUtils {
	// 기본 생성자 f 선언
//	String boardType = "f";
	
	public List<FileVO> parseFileInfo(int boardSeq, HttpServletRequest request, 
			MultipartHttpServletRequest mhsr,String userId) throws IOException {
		
		System.out.println(mhsr.toString());
		if(ObjectUtils.isEmpty(mhsr)) {
			return null;
		}
		
		List<FileVO> fileList = new ArrayList<FileVO>();
		
		String root_path = request.getSession().getServletContext().getRealPath("/");

		String attach_path = "upload/";

		
		File file = new File(root_path + attach_path);
		// file.exists : 저장된 파일이 있는지 확인 
		if(file.exists() == false) {
			// mkdirs : 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 상위 디렉토리까지 생성
			file.mkdirs();
		}
		
		// Iterator : 반복자. 읽어오는 방법 표준화.
		// 파일 이름을 읽어옴
		Iterator<String> iterator = mhsr.getFileNames();
//		System.out.println("fileutils의 getFileNames=============" + mhsr.getFileNames());
		while(iterator.hasNext()) {
			
			List<MultipartFile> list = mhsr.getFiles(iterator.next());
			System.out.println("list.size()======================" + list.size());
			System.out.println("seq==============================" + boardSeq);
			
			// 파일 사이즈가 0보다 크다면 (업로드되었다면) 파일 주소를 조합해서 새로 만든후 file에 저장
			for(MultipartFile mf : list) {
				if(mf.getSize() > 0) {
					FileVO boardFile = new FileVO();
					boardFile.setBoardSeq(boardSeq);
//					boardFile.setBoardType(boardType);
					boardFile.setUserId(userId);
					boardFile.setFileSize(mf.getSize());
					boardFile.setOriginalFileName(mf.getOriginalFilename());
					boardFile.setFilePath(root_path + attach_path);
					fileList.add(boardFile);
					
					file = new File(root_path + attach_path + mf.getOriginalFilename());
					mf.transferTo(file);
				} else {
					fileList = null;
				}
			}
		}
		return fileList;
	}
//	public FileUtils() { /* default Constructor */ }
	
//	// boardType이 f가 아닌 경우 생성자 호출시 boardType 명시후 사용하기
//	public FileUtils(String boardType) {
//		this.boardType = boardType;
//	}
	
}
