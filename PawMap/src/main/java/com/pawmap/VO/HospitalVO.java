package com.pawmap.VO;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class HospitalVO {

	private int hospitalSeq;
	private String hospitalId;
	private String hospitalName;
	private String hospitalAddress; 
	private String hospitalStatusCode;
	private String hospitalTelNum;
	private String hospitalRegDate;
	private String hospitalComNum;
	private String hospitalType;
	
	@Builder
	public HospitalVO(int hospitalSeq, String hospitalId, String hospitalName, String hospitalAddress,
			String hospitalStatusCode, String hospitalTelNum, String hospitalRegDate, String hospitalComNum, String hospitalType) {
		super();
		this.hospitalSeq = hospitalSeq;
		this.hospitalId = hospitalId;
		this.hospitalName = hospitalName;
		this.hospitalAddress = hospitalAddress;
		this.hospitalStatusCode = hospitalStatusCode;
		this.hospitalTelNum = hospitalTelNum;
		this.hospitalRegDate = hospitalRegDate;
		this.hospitalComNum = hospitalComNum;
		this.hospitalType = hospitalType;
	}
	
	
}
