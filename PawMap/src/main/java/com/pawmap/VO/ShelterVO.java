package com.pawmap.VO;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShelterVO {

	private int shelterSeq;
	private String comNum;
	private String shelterName;
	private String shelterAddress;
	private String shelterTel;
	private String content;
}
