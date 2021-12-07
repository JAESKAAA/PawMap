package com.pawmap.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pawmap.VO.BoardVO;
import com.pawmap.VO.FileVO;
import com.pawmap.VO.ReservationVO;
import com.pawmap.VO.ScheduleVO;
import com.pawmap.service.BoardService;
import com.pawmap.service.FileService;
import com.pawmap.service.ReservationService;
import com.pawmap.util.FileUtils;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private FileService fileService;

	@GetMapping("/reservation/form")
	public String getReservationForm(@RequestParam String comNum, Model model) {
		
		List<ScheduleVO> hosScheduleTable = reservationService.getAllScheduleTableOfHospital(comNum);
		
		model.addAttribute("hosScheduleTable" , hosScheduleTable);
		return "res-calendar-form";
	}
	
	@RequestMapping("/reservation/insertSchedule")
	public String insertSchedule(ScheduleVO vo, String date, String comNum) {
		
		// 미리 인서트, 업데이트할 리스트를 만들어놓음
		
		List<ScheduleVO> scheduleList = new ArrayList<>();
		
		String baseScheduleTime[] = {"0900","0930","1000","1030","1100","1130","1200","1230"
				,"1400","1430","1500","1530","1600","1630","1700","1730"
				,"1900","1930","2000","2030","2100"};
		
		System.out.println("date ===== "+ date);
		System.out.println("comNum ===== "+ comNum);
		
		if(vo.getScheduleTime() == null) {
			System.out.println("vo가 널입니다.");
			if(date.equals("sun")) {
				reservationService.resetDateScheduleSun(comNum);
			}
			if(date.equals("mon")) {
				reservationService.resetDateScheduleMon(comNum);
			}
			if(date.equals("tue")) {
				reservationService.resetDateScheduleTue(comNum);
			}
			if(date.equals("wed")) {
				reservationService.resetDateScheduleWed(comNum);
			}
			if(date.equals("thu")) {
				reservationService.resetDateScheduleThu(comNum);
			}
			if(date.equals("fri")) {
				reservationService.resetDateScheduleFri(comNum);
			}
			if(date.equals("sat")) {
				reservationService.resetDateScheduleSat(comNum);
			}
			return "redirect:/reservation/form?comNum="+comNum; 
		}
		
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
	public String ScheduleChoose(@RequestParam String comNum, int hospitalSeq, Model model) {
		
		System.out.println("ScheduleChoose 의 comNum ======="+comNum);
		System.out.println("ScheduleChoose 의 hopitalSeq ======="+hospitalSeq);
		System.out.println("ScheduleChoose 들어옴");
		
		// url comNum= 에 병원 comNum 들어와야 함
		
		List<ScheduleVO> scheduleList = reservationService.getScheduleListByComNum(comNum);
		List<HashMap<String,Object>> hosNickname = reservationService.getHospitalNicknameByComNum(comNum);
		
		System.out.println("hosNickname ======= "+ hosNickname);
		
		model.addAttribute("hospitalSeq",hospitalSeq);
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
	public String doReservation(ReservationVO reservationVO, int hospitalSeq) {
		
		System.out.println("reservationVO ======= "+reservationVO);
		System.out.println("hospitalSeq ======= "+hospitalSeq);
		
		reservationService.insertReservation(reservationVO);
		
		return "redirect:/detailHospital?hospitalSeq="+hospitalSeq;
		
	}
	
	@RequestMapping("/mypage/reservationList")
	public String showReservationList(@RequestParam String userId, Model model) {
		
		List<HashMap<String,Object>> myResList = reservationService.findMyReservationListByUserId(userId);
//		System.out.println("myResList ====== "+ myResList);
		
		List<BoardVO> medicalRecordList = boardService.getMyMedicalRecordListById(userId);
		System.out.println("medicalRecordList =========" + medicalRecordList);
		
		model.addAttribute("myResList",myResList);
		model.addAttribute("medicalRecordList",medicalRecordList);
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
	public String getDetailReservationList(String date, String comNum, Model model ) throws JsonProcessingException {

		System.out.println("getDetailReservationList 들어옴");
		
//		List<BoardVO> vo = boardService.getHospitalMedicalRecordList(date,comNum);

		List<HashMap<String,Object>> reservationList = reservationService.getReservationListOfHospital(date,comNum);
		
		System.out.println("reservationList ========== " + reservationList);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String json = "";
		
		json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(reservationList);
		
		System.out.println(json);
		
		return json;
		
	}
	
	@RequestMapping("/reservation/writeMedicalRecordForm")
	public String writeMedicalRecord (String comNum, int reservationSeq,Model model) {
		System.out.println("writeMedicalRecord 들어옴 ====");
		
		List<HashMap<String,Object>> vo =  reservationService.getReservationInfo(comNum,reservationSeq);

		
		String reservationDate = vo.get(0).get("reservation_date").toString();
		String scheduleTime = vo.get(0).get("schedule_time").toString();
		List<HashMap<String,Object>> medicalRecord = boardService.getSeparateMedicalRecordForClient(comNum, reservationDate, scheduleTime);
		System.out.println("medicalRecord ======== "+ medicalRecord);
		
		if(!medicalRecord.isEmpty()) {
			
			model.addAttribute("medicalRecord",medicalRecord);
			
			int boardSeq = Integer.parseInt(medicalRecord.get(0).get("board_seq").toString()); 
			List<FileVO> fileList = fileService.getFileListByMedicalBoardSeq(boardSeq);
			model.addAttribute("fileList",fileList);
		}
		
		model.addAttribute("reservationInfo",vo);
		
		return "medicalRecordForm";
	}
	
	@RequestMapping("/reservation/insertWriteRecord")
	public String insertMedicalRecord(BoardVO vo, HttpServletRequest request,
			MultipartHttpServletRequest mhsr) throws IOException {
		System.out.println("insertMedicalRecord ===== 들어옴 ");
		System.out.println("insertMedicalRecord ===== vo " + vo );
		
		boardService.insertMedicalRecord(vo);
		
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setComNum(vo.getComNum());
		reservationVO.setReservationDate(vo.getReservationDate());
		reservationVO.setScheduleTime(vo.getScheduleTime());
		reservationVO.setReservationStatus("done");
		
		reservationService.changeReservationStatus(reservationVO);
		
		int boardSeq = boardService.getMedicalBoardSeq()-1;
		String userId = vo.getUserId();
		
		System.out.println("boardSeq ============ "+ boardSeq);
		
		FileUtils fileUtils = new FileUtils();
		List<FileVO> fileList = fileUtils.parseFileInfo(boardSeq, request, mhsr,userId);

		if(CollectionUtils.isEmpty(fileList) == false) {
			fileService.insertMedicalFileList(fileList);
		}
		
		return "redirect:/reservation/form?comNum="+vo.getComNum();
	}
	
	@RequestMapping("showMyMedicalRecord")
	public String showMedicalRecord(@RequestParam String comNum, String reservationDate, String scheduleTime, String userId ,Model model) {
		System.out.println(comNum);
		System.out.println(reservationDate);
		System.out.println(scheduleTime);
		
		List<HashMap<String,Object>> medicalRecord = boardService.getSeparateMedicalRecordForClient(comNum, reservationDate, scheduleTime);
		System.out.println("showMedicalRecord vo ========= "+medicalRecord);
		if(medicalRecord.size() == 0) {
			return "redirect:/mypage/reservationList?userId="+userId;
		}
		
		int boardSeq = Integer.parseInt(medicalRecord.get(0).get("board_seq").toString());
		System.out.println("파일 가져오기를 위한 boardSeq ====== "+boardSeq);
		
		List<FileVO> fileList = fileService.getFileListByMedicalBoardSeq(boardSeq);
		System.out.println("showMedicalRecord 의 fileList ========"+fileList);
		
		model.addAttribute("medicalFileList",fileList);
		model.addAttribute("medicalRecord",medicalRecord);
		
		return "medicalRecordShow";
	}
	
	@RequestMapping("/reservation/updateWriteRecord")
	public String updateWriteRecord(BoardVO vo) {
		System.out.println("updateWriteRecord 들어옴");
		System.out.println("updateWriteRecord vo ========= "+ vo);
		boardService.updateMedicalRecord(vo);
		return "redirect:/reservation/form?comNum="+vo.getComNum();
	}
	
	@RequestMapping("/reservation/saperateDeleteFileOnMedicalBoard")
	public String saperateDeleteFileOnMedicalBoard(int fileSeq, int boardSeq, String comNum, int reservationSeq) {
		System.out.println("saperateDeleteFileOnMedicalBoard 들어옴");
		System.out.println(fileSeq);
		System.out.println(boardSeq);
		System.out.println("comNum======= "+ comNum);
		
		fileService.deleteOneFileOnMedicalRecord(fileSeq,boardSeq);
		
		return "redirect:/reservation/writeMedicalRecordForm?comNum="+comNum +"&reservationSeq="+reservationSeq;
	}
	
	@RequestMapping("/reservation/updateMedicalRecordFormInsertFiles")
	public String updateMedicalRecordFormInsertFiles(String userId,HttpServletRequest request,
			MultipartHttpServletRequest mhsr, int boardSeq,String comNum, int reservationSeq) throws IOException {
		
		System.out.println("updateMedicalRecordFormInsertFiles 들어옴");
		
		FileUtils fileUtils = new FileUtils();
		List<FileVO> fileList = fileUtils.parseFileInfo(boardSeq, request, mhsr,userId);
		
		if(CollectionUtils.isEmpty(fileList) == false) {
			fileService.insertMedicalFileList(fileList);
		}
		
		return "redirect:/reservation/writeMedicalRecordForm?comNum="+comNum +"&reservationSeq="+reservationSeq;
		
	}
	
	
	
}
