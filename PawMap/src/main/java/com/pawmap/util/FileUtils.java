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
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		Iterator<String> iterator = mhsr.getFileNames();
		while(iterator.hasNext()) {
			
			List<MultipartFile> list = mhsr.getFiles(iterator.next());
			System.out.println("list.size()======================" + list.size());
			System.out.println("seq==============================" + boardSeq);
			
			for(MultipartFile mf : list) {
				if(mf.getSize() > 0) {
					FileVO boardFile = new FileVO();
					boardFile.setBoardSeq(boardSeq);
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
}
