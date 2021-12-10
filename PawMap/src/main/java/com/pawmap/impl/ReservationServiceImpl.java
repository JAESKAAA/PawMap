package com.pawmap.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawmap.VO.ReservationVO;
import com.pawmap.VO.ScheduleVO;
import com.pawmap.mapper.ReservationMapper;
import com.pawmap.service.ReservationService;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationMapper reservationMapper;

	@Override
	public void insertSchedule(List<ScheduleVO> scheduleList) {
		reservationMapper.insertSchedule(scheduleList);
	}

	@Override
	public boolean isExistSchedule(String userId) {
		return reservationMapper.isExistSchedule(userId);
	}

	@Override
	public void updateReservationSun(List<ScheduleVO> scheduleList) {
		reservationMapper.updateReservationSun(scheduleList);
		
	}

	@Override
	public void updateReservationMon(List<ScheduleVO> scheduleList) {
		reservationMapper.updateReservationMon(scheduleList);
		
	}

	@Override
	public void updateReservationTue(List<ScheduleVO> scheduleList) {
		reservationMapper.updateReservationTue(scheduleList);
		
	}

	@Override
	public void updateReservationWed(List<ScheduleVO> scheduleList) {
		reservationMapper.updateReservationWed(scheduleList);
		
	}

	@Override
	public void updateReservationThu(List<ScheduleVO> scheduleList) {
		reservationMapper.updateReservationThu(scheduleList);
		
	}

	@Override
	public void updateReservationFri(List<ScheduleVO> scheduleList) {
		reservationMapper.updateReservationFri(scheduleList);
		
	}

	@Override
	public void updateReservationSat(List<ScheduleVO> scheduleList) {
		reservationMapper.updateReservationSat(scheduleList);
		
	}

	@Override
	public List<ScheduleVO> getScheduleListByComNum(String comNum) {
		
		return reservationMapper.getScheduleListByComNum(comNum);
	}

	@Override
	public List<ScheduleVO> getDetailScheduleList(String date, String comNum) {
		
		return reservationMapper.getDetailScheduleList(date, comNum);
	}

	@Override
	public void insertReservation(ReservationVO reservationVO) {
		reservationMapper.insertReservation(reservationVO);
	}

	@Override
	public List<ReservationVO> getReservationList(String date, String comNum) {
		return reservationMapper.getReservationList(date, comNum);
	}

	@Override
	public List<HashMap<String, Object>> findMyReservationListByUserId(String userId) {
		return reservationMapper.findMyReservationListByUserId(userId);
	}

	@Override
	public void cancelReservation(ReservationVO reservationVO) {
		reservationMapper.cancelReservation(reservationVO);
	}

	@Override
	public List<ScheduleVO> getAllScheduleTableOfHospital(String comNum) {
		return reservationMapper.getAllScheduleTableOfHospital(comNum);
	}

	@Override
	public List<HashMap<String, Object>> getHospitalNicknameByComNum(String comNum) {
		return reservationMapper.getHospitalNicknameByComNum(comNum);
	}

	@Override
	public List<HashMap<String, Object>> getReservationListOfHospital(String date, String comNum) {
		return reservationMapper.getReservationListOfHospital(date, comNum);
	}

	@Override
	public List<HashMap<String, Object>> getReservationInfo(String comNum, int reservationSeq) {
		return reservationMapper.getReservationInfo(comNum,reservationSeq);
	}

	@Override
	public void changeReservationStatus(ReservationVO reservationVO) {
		reservationMapper.changeReservationStatus(reservationVO);
	}

	@Override
	public void resetDateScheduleSun(String comNum) {
		reservationMapper.resetDateScheduleSun(comNum);
	}

	@Override
	public void resetDateScheduleMon(String comNum) {
		reservationMapper.resetDateScheduleMon(comNum);
	}

	@Override
	public void resetDateScheduleTue(String comNum) {
		reservationMapper.resetDateScheduleTue(comNum);
	}

	@Override
	public void resetDateScheduleWed(String comNum) {
		reservationMapper.resetDateScheduleWed(comNum);
	}

	@Override
	public void resetDateScheduleThu(String comNum) {
		reservationMapper.resetDateScheduleThu(comNum);
	}

	@Override
	public void resetDateScheduleFri(String comNum) {
		reservationMapper.resetDateScheduleFri(comNum);
	}

	@Override
	public void resetDateScheduleSat(String comNum) {
		reservationMapper.resetDateScheduleSat(comNum);
	}

	

	

	
	
	

	

}
