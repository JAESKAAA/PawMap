package com.pawmap.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pawmap.VO.ReservationVO;
import com.pawmap.VO.ScheduleVO;
import com.pawmap.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;

	@GetMapping("/reservation/form")
	public String getReservationForm(@RequestParam String comNum, Model model) {
		
		List<ScheduleVO> hosScheduleTable = reservationService.getAllScheduleTableOfHospital(comNum);
		
		model.addAttribute("hosScheduleTable" , hosScheduleTable);
		return "res-calendar-form";
	}
	
	@RequestMapping("/reservation/insertSchedule")
	public String insertSchedule(ScheduleVO vo, String date) {
		
		// 미리 인서트, 업데이트할 리스트를 만들어놓음
		
		List<ScheduleVO> scheduleList = new ArrayList<>();
		
		String baseScheduleTime[] = {"0900","0930","1000","1030","1100","1130","1200","1230"
				,"1400","1430","1500","1530","1600","1630","1700","1730"
				,"1900","1930","2000","2030","2100"};
		
		String[] scheduleTime = vo.getScheduleTime().split(",");
		
		for(int i = 0; i<baseScheduleTime.length; i++) {
			ScheduleVO scheduleVO = new ScheduleVO();
			scheduleVO.setScheduleTime(baseScheduleTime[i]);
			scheduleList.add(scheduleVO);
		}
		
		boolean isExist = reservationService.isExistSchedule(vo.getUserId());
		System.out.println("isExist ========== "+isExist);
		
		if(isExist) {
			
			boolean isSun = false;
			boolean isMon = false;
			boolean isTue = false;
			boolean isWed = false;
			boolean isThu = false;
			boolean isFri = false;
			boolean isSat = false;
			
			for(int i = 0; i<scheduleList.size(); i++) {
				for(int j = 0; j<scheduleTime.length; j++)
					if(scheduleList.get(i).getScheduleTime().equals(scheduleTime[j])) {
						if(date.equals("sun")) {
							scheduleList.get(i).setSun("yes");
							isSun = true;
						}
						if(date.equals("mon")) {
							scheduleList.get(i).setMon("yes");
							isMon = true;
						}
						if(date.equals("tue")) {
							scheduleList.get(i).setTue("yes");
							isTue = true;
						}
						if(date.equals("wed")) {
							scheduleList.get(i).setWed("yes");
							isWed = true;
						}
						if(date.equals("thu")) {
							scheduleList.get(i).setThu("yes");
							isThu = true;
						}
						if(date.equals("fri")) {
							scheduleList.get(i).setFri("yes");
							isFri = true;
						}
						if(date.equals("sat")) {
							scheduleList.get(i).setSat("yes");
							isSat = true;
						}
					}
				scheduleList.get(i).setUserId(vo.getUserId());
				scheduleList.get(i).setComNum(vo.getComNum());
			}

			if(isSun) {
				System.out.println("isSun ======= " + isSun);
				reservationService.updateReservationSun(scheduleList);
			}
			if(isMon) {
				System.out.println("isMon ======= " + isMon);
				reservationService.updateReservationMon(scheduleList);
			}
			if(isTue) {
				System.out.println("isTue ======= " + isTue);
				reservationService.updateReservationTue(scheduleList);
			}
			if(isWed) {
				System.out.println("isWed ======= " + isWed);
				reservationService.updateReservationWed(scheduleList);
			}
			if(isThu) {
				System.out.println("isThu ======= " + isThu);
				reservationService.updateReservationThu(scheduleList);
			}
			if(isFri) {
				System.out.println("isFri ======= " + isFri);
				reservationService.updateReservationFri(scheduleList);
			}
			if(isSat) {
				System.out.println("isSat ======= " + isSat);
				reservationService.updateReservationSat(scheduleList);
			}
			
			System.out.println(scheduleList);
			for(int i = 0; i<scheduleTime.length; i++) {
				System.out.println(scheduleTime[i]);
			}
			
		}else {
			for(int i = 0; i<scheduleList.size(); i++) {
				for(int j = 0; j<scheduleTime.length; j++)
					if(scheduleList.get(i).getScheduleTime().equals(scheduleTime[j])) {
						if(date.equals("sun")) {
							scheduleList.get(i).setSun("yes");
						}
						if(date.equals("mon")) {
							scheduleList.get(i).setMon("yes");
						}
						if(date.equals("tue")) {
							scheduleList.get(i).setTue("yes");
						}
						if(date.equals("wed")) {
							scheduleList.get(i).setWed("yes");
						}
						if(date.equals("thu")) {
							scheduleList.get(i).setThu("yes");
						}
						if(date.equals("fri")) {
							scheduleList.get(i).setFri("yes");
						}
						if(date.equals("sat")) {
							scheduleList.get(i).setSat("yes");
						}
					}
				scheduleList.get(i).setUserId(vo.getUserId());
				scheduleList.get(i).setComNum(vo.getComNum());
			}
			
			System.out.println(scheduleList);
			for(int i = 0; i<scheduleTime.length; i++) {
				System.out.println(scheduleTime[i]);
			}
			
			reservationService.insertSchedule(scheduleList);
			
		}
		
		return "redirect:/reservation/form?comNum="+vo.getComNum();
	}
	
	@RequestMapping("/reservation/choose")
	public String ScheduleChoose(@RequestParam String comNum, Model model) {
		
		System.out.println("ScheduleChoose 의 comNum ======="+comNum);
		System.out.println("ScheduleChoose 들어옴");
		
		// url comNum= 에 병원 comNum 들어와야 함
		
		List<ScheduleVO> scheduleList = reservationService.getScheduleListByComNum(comNum);
		List<HashMap<String,Object>> hosNickname = reservationService.getHospitalNicknameByComNum(comNum);
		
		System.out.println("hosNickname ======= "+ hosNickname);
		
		model.addAttribute("scheduleList",scheduleList);
		model.addAttribute("hosNickname", hosNickname);
		
		return "res-calendar";
	}
	
	@RequestMapping(value="/reservation/getScheduleList", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getDetailScheduleList(String date, String comNum ) throws JsonProcessingException {
		System.out.println(date);
		System.out.println(comNum);
		System.out.println("getDetailScheduleList 들어옴");
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<ScheduleVO> detailScheduleList = reservationService.getDetailScheduleList(date, comNum );
		for(int i = 0; i<detailScheduleList.size(); i++) {
			detailScheduleList.get(i).setComNum(comNum);
		}
		List<ReservationVO> getReservationList = reservationService.getReservationList(date, comNum);
		
		resultMap.put("detailScheduleList", detailScheduleList);
		resultMap.put("getReservationList", getReservationList);
		
//		objectList.add(detailScheduleList);
//		objectList.add(getReservationList);
		
//		System.out.println("detailScheduleList ========" +detailScheduleList);
//		System.out.println("getReservationList ======== "+getReservationList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String json = "";
		
		json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(resultMap);
		
//		System.out.println("JSON STRING ======= "+ json);
		
		return json;
		
	}
	
	@RequestMapping("/reservation/doReservation")
	public String doReservation(ReservationVO reservationVO) {
		
		System.out.println("reservationVO ======= "+reservationVO);
		
		reservationService.insertReservation(reservationVO);
		
		return "redirect:/";
		
	}
	
	@RequestMapping("/mypage/reservationList")
	public String showReservationList(@RequestParam String userId, Model model) {
		System.out.println("userId========"+userId);
		
		List<HashMap<String,Object>> myResList = reservationService.findMyReservationListByUserId(userId);
		System.out.println("myResList ====== "+ myResList);
		model.addAttribute("myResList",myResList);
		return "my_account_reservation_list";
	}
	
	@RequestMapping("/mypage/cancelReservation")
	public String cancelReservation(ReservationVO reservationVO) {
		System.out.println("cancelReservation 들어옴 ======"+reservationVO);
		reservationService.cancelReservation(reservationVO);
		return "redirect:/mypage/reservationList?userId="+reservationVO.getUserId();
	}
	
	@RequestMapping(value="/reservation/getReservationList", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getDetailReservationList(String date, String comNum ) throws JsonProcessingException {
		System.out.println(date);
		System.out.println(comNum);
		System.out.println("getDetailReservationList 들어옴");
		
		List<HashMap<String,Object>> reservationList = reservationService.getReservationListOfHospital(date,comNum);
		
		System.out.println("reservationList ========== " + reservationList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String json = "";
		
		json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(reservationList);
		
		System.out.println(json);
		
		return json;
		
	}
	
}
