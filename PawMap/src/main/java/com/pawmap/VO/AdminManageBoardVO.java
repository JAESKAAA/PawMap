package com.pawmap.VO;

import java.sql.Date;
/* thomas lee added this Value Object class for admin management.. it was created on nov 26thg 18:27pm*/
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminManageBoardVO {
	private int userSeq;
	private String userType;
	private String userId;

	private String userName;
	private String userTelNum;
	private String address;
	private String userNickname;
	private String role;
	private Date userRegDate;
	private String userProfile;
	private int userProfileSize;
	
	
	
	private String comNum;
}
