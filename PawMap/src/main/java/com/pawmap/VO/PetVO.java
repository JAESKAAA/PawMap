package com.pawmap.VO;


import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetVO {

	/** 번호 (PK) */
	private int petSeq;
	//petFileVO를 따로 만들어야하나?
	
	/** 회원명 **/
	private String userId;

	/** 동물명 */
	private String name;

	/** 성별 **/
	private String gender;
	
	/** 나이 */
	private String age;

	/** 종 */
	private String petType;
	
	/** 종 상세 */
	private String petTypeDetail;

	/** 사진 업로드 **/
	private MultipartFile uploadPetFiles;
	
	/** 증상 **/
	private String symptom;
	
	private String status;
	
	
//	petProfile
//	petProfileSize
	
}