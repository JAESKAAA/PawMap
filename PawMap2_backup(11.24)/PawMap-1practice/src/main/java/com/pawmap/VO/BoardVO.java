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
	//private MultipartFile uploadFile; //11�� 22�� ���� 2:25pm ���� ���ε� �̽� ����....
	
//	@Builder
//	public BoardVO(int boardSeq, String boardType, String userId, int hospitalSeq, String title, String content,
//			Date regDate) {
//		super();
//		this.boardSeq = boardSeq;
//		this.boardType = boardType;
//		this.userId = userId;
//		this.hospitalSeq = hospitalSeq;
//		this.title = title;
//		this.content = content;
//		this.regDate = regDate;
//	}

	
}
