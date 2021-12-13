package com.pawmap.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LikeVO {

	private int reviewSeq;
	private String userId;
	private String comNum;
	private int likeCheck;
	private int count;
	
}
