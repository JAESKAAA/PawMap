package com.pawmap.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationVO {

	private String comNum;
	private String userId;
	private String scheduleTime;
	private String reservationDate;
	private String reservationStatus;
	
}
