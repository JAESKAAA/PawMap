package com.pawmap.VO;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserVO {
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userName;
	private String userTelNum;
	private String address1;
	private String address2;
	private String address3;
	private String userNickname;
	private String role;
	private Date userRegDate;
	private String userProfile;
	private int userProfileSize;
	private String userStatus;
	private String provider;
	private String providerId;
	
	@Builder
	public UserVO(String userId, String userPassword, String userEmail, String userName, String userTelNum,
			String address1, String address2, String address3,String userNickname, String role, Date userRegDate, String userProfile, int userProfileSize,
			String userStatus, String provider, String providerId) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userName = userName;
		this.userTelNum = userTelNum;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.userNickname = userNickname;
		this.role = role;
		this.userRegDate = userRegDate;
		this.userProfile = userProfile;
		this.userProfileSize = userProfileSize;
		this.userStatus = userStatus;
		this.provider = provider;
		this.providerId = providerId;
	}
	
	
	

	
	
	
}
