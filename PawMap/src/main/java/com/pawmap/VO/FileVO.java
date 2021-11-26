package com.pawmap.VO;

import lombok.Data;

@Data
public class FileVO {

	private int fileSeq;
	private int boardSeq;
	private String boardType;
	private String userId;
	private String originalFileName;
	private String filePath;
	private long fileSize;
	
}
