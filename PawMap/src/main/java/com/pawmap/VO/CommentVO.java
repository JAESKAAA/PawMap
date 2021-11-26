package com.pawmap.VO;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO {

	private int commentSeq;
	private int boardSeq;
	private String boardType;
	private String userId;
	private int hopitalSeq;
	private String commentContent;
	private Date commentRegdate;
	
}
