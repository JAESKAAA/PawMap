package com.pawmap.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.pawmap.VO.ReservationVO;
import com.pawmap.VO.ScheduleVO;

@Mapper
public interface ReservationMapper {

	void insertSchedule(List<ScheduleVO> scheduleList);

	boolean isExistSchedule(@Param("userId") String userId);

	void updateReservationSun(List<ScheduleVO> scheduleList);

	void updateReservationMon(List<ScheduleVO> scheduleList);

	void updateReservationTue(List<ScheduleVO> scheduleList);

	void updateReservationWed(List<ScheduleVO> scheduleList);

	void updateReservationThu(List<ScheduleVO> scheduleList);

	void updateReservationFri(List<ScheduleVO> scheduleList);

	void updateReservationSat(List<ScheduleVO> scheduleList);

	List<ScheduleVO> getScheduleListByComNum(@Param("comNum") String comNum);

	List<ScheduleVO> getDetailScheduleList(@Param("date") String date,@Param("comNum") String comNum);

	void insertReservation(ReservationVO reservationVO);

	List<ReservationVO> getReservationList(@Param("date")String date ,@Param("comNum")String comNum);

	List<HashMap<String, Object>> findMyReservationListByUserId(String userId);

	void cancelReservation(ReservationVO reservationVO);

	List<ScheduleVO> getAllScheduleTableOfHospital(String comNum);

	List<HashMap<String, Object>> getHospitalNicknameByComNum(String comNum);

	List<HashMap<String, Object>> getReservationListOfHospital(@Param("date")String date,@Param("comNum") String comNum);

	List<HashMap<String, Object>> getReservationInfo(@Param("comNum")String comNum,@Param("reservationSeq") int reservationSeq);

	void changeReservationStatus(ReservationVO reservationVO);

	void resetDateScheduleSun(String comNum);

	void resetDateScheduleMon(String comNum);

	void resetDateScheduleTue(String comNum);

	void resetDateScheduleWed(String comNum);

	void resetDateScheduleThu(String comNum);

	void resetDateScheduleFri(String comNum);

	void resetDateScheduleSat(String comNum);

	

	

}
