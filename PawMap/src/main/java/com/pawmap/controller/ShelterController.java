package com.pawmap.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pawmap.VO.FileVO;
import com.pawmap.VO.ShelterVO;
import com.pawmap.mapper.ShelterMapper;
import com.pawmap.service.FileService;
import com.pawmap.service.ShelterService;
import com.pawmap.util.FileUtils;

@Controller
public class ShelterController {
	
	@Autowired
	private ShelterService shelterService;
	
	@Autowired 
	private ShelterMapper shelterMapper;
	
	@Autowired
	private FileService fileService;
	
	
	// 관리자페이지 -> 보호소 관리 페이지로 이동
	@RequestMapping("/admin/shelterList")
	public String ShelterBoardList(ShelterVO vo, Model model) {
		System.out.println("shelterList 통과===================");
		List<ShelterVO> shelter = shelterMapper.getShelterList(vo);
		System.out.println("shelter에 담긴값 출력===========" + shelter);
		
		 model.addAttribute("shelter", shelterMapper.getShelterList(vo));
		
		return "admin_shelter";
	}
	

	
	
	// 관리자페이지 -> 보호소 관리 페이지 -> 글 수정 화면으로 이동 (update)
	@GetMapping("/admin/updateShelterForm")
	public String updateShelterForm(@RequestParam int shelterSeq, Model model) {
		System.out.println("update Shelter Form 통과");
		System.out.println("sheqlterSeq===================" + shelterSeq);
		
		List<FileVO> fileList = fileService.getFileListByShelterSeq(shelterSeq, "t");
		System.out.println("파일리스트담긴거==== "+fileList);
		// 이 생성자를 탈때 boardType을 v로 선언하게함
		FileUtils fileUtils = new FileUtils();
		
		model.addAttribute("fileList",fileList);
		model.addAttribute("getShelter",shelterMapper.getShelter(shelterSeq));
		
		System.out.println("update Shelter Form의 model값 ===========" + model);
		
		return "admin_shelter_modify";
	}
	
	
	// 보호소 업데이트
	@PostMapping("/admin/updateShelterForm/api")
	public String updateShelterForm(ShelterVO vo) {
		System.out.println("updateFreeBoardForm  : " + "들어옴====");
		System.out.println("vo ======== "+ vo);
		
		 int seq = vo.getShelterSeq();
		 
		 System.out.println("seq값 ==="+seq);
		 
			shelterService.updateShelterForm(vo);
			
		return "redirect:/admin/shelterList";
	}
	

	
	// 관리자페이지 -> 보호소 관리 페이지 -> 글 등록 화면으로 이동
	@GetMapping("/admin/shelterForm")
	public String shelterForm() {
		return "admin_shelter_form";
	}
	
	
	// 관리자페이지 -> 보호소 관리 페이지 -> 글 등록 화면의 insert form
	@PostMapping("/admin/insertShelterForm")
	public String insertShelterForm (ShelterVO vo, HttpServletRequest request,
	MultipartHttpServletRequest mhsr) throws IOException  {
		
		shelterService.insertShelterForm(vo);
		int shelterSeq = shelterService.getShelterSeq();
		

		System.out.println("getShelterSeq 구간 통과");
		System.out.println("ShelterSeq ======" + shelterSeq);
		
		FileUtils fileUtils = new FileUtils();
		
		List<FileVO> fileList = fileUtils.parseFileInfo(shelterSeq, request, mhsr, "admin");
		System.out.println("file타는감 ============" + fileList);
		
			fileService.insertShelterFileList(fileList);

	

		System.out.println("insertShelterForm을 탔다!!!!!");
		System.out.println("그렇다면 BoardVO는? ============== "+vo);
		
		
		return "redirect:shelterList";
		
	}
	
//	--------------------------- 수정중 -------------------------------------
	
//	// 글 삭제 메소드
//	@GetMapping("/admin/deleteShelterForm")
//	public String deleteShelterForm(@RequestParam("shelterSeq") String shelterSeq) {
//		System.out.println("�깘============================" + shelterSeq);
//		
//		ShelterService.deleteShelterForm(Integer.parseInt(shelterSeq));
//		fileService.deleteFileByShelterSeq(shelterSeq);
//		
//		System.out.println("deleteShelterForm �넻怨�=================================");
//		
//		return "redirect:shelterList";
//	}
	
	// 보호소 관리 페이지 삭제 관련 메소드
	@GetMapping("/admin/deleteShelterForm")
	public String deleteShelterForm(int shelterSeq) {
		System.out.println("deleteShelterForm의 shelterSeq값============================" + shelterSeq);
		
		shelterService.deleteShelterForm(shelterSeq);
		fileService.deleteFileByBoardSeqOnShelterSeq(shelterSeq);
		
		System.out.println("deleteShelterForm 통과=================================");
		
		return "redirect:shelterList";
	}
	
	// 글 디테일 - 파일 삭제 메소드
	@RequestMapping("/admin/separateDeleteFileOnShelectForm")
	public String separateDeleteFileOnShelter(int fileSeq, int boardSeq) {
		System.out.println(fileSeq);
		System.out.println(boardSeq);
		System.out.println("separateDeleteFileOnShelectForm 통과===================");
		
		fileService.deleteShelterFile(fileSeq,boardSeq);
		
		System.out.println("separateDeleteFileOnShelectForm의 fileSeq,boardSeq=====>" + fileSeq + " / " +boardSeq);
		
		return "redirect:updateShelterForm?shelterSeq="+boardSeq;
		
	}
	
	// 글 디테일 - 파일 삭제 후 재업로드 할떄 쓰는 메소드
	@RequestMapping("/admin/updateShelterFormInsertFiles")
	public String updateShelterFormInsertFiles(String shelterName,HttpServletRequest request,
			MultipartHttpServletRequest mhsr, int boardSeq) throws IOException {
		
		System.out.println("updateShelterFormInsertFiles 통과=============");
		
		System.out.println("boardSeq == "+boardSeq);
		
		FileUtils fileUtils = new FileUtils();
		List<FileVO> fileList = fileUtils.parseFileInfo(boardSeq, request, mhsr, "admin");
		
		System.out.println("쉘터 파일리스트 === " +fileList);
		if(CollectionUtils.isEmpty(fileList) == false) {
			fileService.insertShelterFileList(fileList);
		}
		
		return "redirect:updateShelterForm?shelterSeq="+boardSeq;
		
	}
	
	
//	// 메소드 합치려다 실패한것
//	@RequestMapping("/admin/updateShelterFormInsertFiles")
//	public String updateShelterFormInsertFiles(FileVO vo,HttpServletRequest request,
//			MultipartHttpServletRequest mhsr) throws IOException {
//		String retMsg = "변경되었습니다.";
//		
//		System.out.println("파일 변경 작업 진입함=====================");
//		
//		System.out.println(mhsr.getParameter("fileTask"));
//		System.out.println(vo);
//		
//		// 파일이 변경된 경우
//		if("U".equals(mhsr.getParameter("fileTask"))) {
//			// fileList.get(0) -> List에서 첫번째 row 가져오는거
//			fileService.insertUpdateOneFile(vo);
//		// 파일이 삭제된 경우
//		} else {
//			// 파일이 존재했으면 삭제, 없으면 delete row 없음
//			fileService.deleteTargetFile(vo);
//			retMsg = "삭제되었습니다.";
//		}
//		
//		return retMsg;
//		
//	}
	
	@GetMapping("/getShelterByJson")
	@ResponseBody
	public Map<String,Object> getShelterByJson(@PathParam("search_value")String value, Model model) {
		
		System.out.println("받은 데이터 == "+ value);
		
		List<ShelterVO> shelterList= shelterService.getShelterList(null);
		Map<String, Object> shelterMap = new HashMap<>();
				
		shelterMap.put("shelterList", shelterList);	
		
		return shelterMap;
	}
}
