package com.pawmap.service;

import java.util.HashMap;
import java.util.List;

import com.pawmap.VO.ReservationVO;
import com.pawmap.VO.ScheduleVO;

public interface ReservationService {

	void insertSchedule(List<ScheduleVO> scheduleList);

	boolean isExistSchedule(String userId);

	void updateReservationSun(List<ScheduleVO> scheduleList);

	void updateReservationMon(List<ScheduleVO> scheduleList);

	void updateReservationTue(List<ScheduleVO> scheduleList);

	void updateReservationWed(List<ScheduleVO> scheduleList);

	void updateReservationThu(List<ScheduleVO> scheduleList);

	void updateReservationFri(List<ScheduleVO> scheduleList);

	void updateReservationSat(List<ScheduleVO> scheduleList);

	List<ScheduleVO> getScheduleListByComNum(String comNum);

	List<ScheduleVO> getDetailScheduleList(String date, String comNum);

	void insertReservation(ReservationVO reservationVO);

	List<ReservationVO> getReservationList(String date, String comNum);

	List<HashMap<String, Object>> findMyReservationListByUserId(String userId);

	void cancelReservation(ReservationVO reservationVO);

	List<ScheduleVO> getAllScheduleTableOfHospital(String comNum);

	List<HashMap<String, Object>> getHospitalNicknameByComNum(String comNum);

	List<HashMap<String, Object>> getReservationListOfHospital(String date, String comNum);

	

	

	

}
