package com.pawmap.VO;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {

	private int boardSeq;
	private String boardType;
	private String userId;
	private int hospitalSeq;
	private String comNum;
	private String title;
	private String content;
	private Timestamp regDate;
	private String keywordType;
	private String keyword;
	private UserVO userVO;
	private String reservationDate;
	private String scheduleTime;
	private int cnt;
	private int count;

	
	private MultipartFile uploadFiles;
	


}
