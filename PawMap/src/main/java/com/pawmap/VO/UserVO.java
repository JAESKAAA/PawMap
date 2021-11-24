package com.pawmap.VO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	private String user_id;
	private String user_password;
	private String user_email;
	private String user_name;
	private String user_tel_num;
	private String address;
	private String user_nickname;
	private String type;
	private Date user_reg_date;
	private String user_profile;
	private int user_profile_size;
	private String user_status;
	
}
