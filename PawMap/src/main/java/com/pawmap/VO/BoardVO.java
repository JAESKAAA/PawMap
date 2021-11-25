package com.pawmap.VO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private int boardSeq;
	private String boardType;
	private String userId;
	private int hospitalSeq;
	private String title;
	private String content;
	private Date regDate;
	
//	Á¶È¸¼ö
	public String getCnt() {
		return null;
	}
	

}
