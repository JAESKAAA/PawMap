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



public class PetFileUtils {
	private String boardType;

	
	public PetFileUtils(String boardType) {
		this.boardType=boardType;
	}

	public List<FileVO> parseFileInfo(int boardSeq, HttpServletRequest request, 
			MultipartHttpServletRequest mhsr,String userId) throws IOException {
		System.out.println("FileUtils들어옴");
		System.out.println(mhsr.toString());
		
		
		if(ObjectUtils.isEmpty(mhsr)) {
			System.out.println("파일없음=====" +mhsr.toString());
			return null;
		}
		
		List<FileVO> fileList = new ArrayList<FileVO>();
		System.out.println("33줄"+fileList);
		
		String root_path = request.getSession().getServletContext().getRealPath("/");
		System.out.println("34줄"+root_path);

		String attach_path = "upload/";
		System.out.println("37줄"+attach_path);
		
		File file = new File(root_path + attach_path);
		System.out.println(file.exists());
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		Iterator<String> iterator = mhsr.getFileNames();
		
		System.out.println("뭐가들어있냐 = "+iterator.hasNext());
		
		System.out.println("47줄 fileName" + mhsr.getFileNames().toString());
		while(iterator.hasNext()) {
			
			List<MultipartFile> list = mhsr.getFiles(iterator.next());
			System.out.println("list.size()======================" + list.size());
			System.out.println("seq==============================" + boardSeq);
			
			for(MultipartFile mf : list) {
				if(mf.getSize() > 0) {
					FileVO boardFile = new FileVO();
					//수의사의 경우 vetSeq가 여기에 들어감
					boardFile.setBoardSeq(boardSeq);
					boardFile.setBoardType(boardType);
					//제휴병원 아이디가 들어가야함
					boardFile.setUserId(userId);
					boardFile.setFileSize(mf.getSize());
					boardFile.setOriginalFileName(mf.getOriginalFilename());
					boardFile.setFilePath(root_path + attach_path);
					fileList.add(boardFile);
					
					
					
					file = new File(root_path + attach_path + mf.getOriginalFilename());
					mf.transferTo(file);
					System.out.println("file Transfer 완!==================");
				} else {
					fileList = null;
				}
			}
		}
		return fileList;
	}
	


}
