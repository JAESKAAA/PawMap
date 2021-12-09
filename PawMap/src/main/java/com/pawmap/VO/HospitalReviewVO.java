package com.pawmap.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HospitalReviewVO {

	private int reviewSeq;
	private int hospitalSeq;
	private String comNum;
	private String userId;
	private String userNickname;
	private String content;
	private String regDate;
	
	
}
