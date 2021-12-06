package com.pawmap.VO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VetVO {

	/** 수의사번호 (PK) */
	private int vetSeq;
	//petFileVO를 따로 만들어야하나?
	
	/** 병원회원 시퀀스 **/
	private int hospitalSeq;

	/** 수의사명 */
	private String vetName;

	/** 전공 **/
	private String vetMajor;
	
	/** 소개 */
	private String vetIntro;

	
	
//	vetProfile
//	vetProfileSize
	
}