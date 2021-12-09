package com.pawmap.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pawmap.VO.FileVO;
import com.pawmap.VO.PetVO;
import com.pawmap.VO.UserVO;
import com.pawmap.VO.VetVO;
import com.pawmap.service.FileService;
import com.pawmap.service.UserService;
import com.pawmap.service.VetService;
import com.pawmap.util.FileUtils;
import com.pawmap.util.PetFileUtils;

@Controller
public class VetController {

	@Autowired
	private VetService vetService;
	
	@Autowired
	private FileService fileService;
	
	
	@Autowired
	private UserService userService;
	
	
	/*수의사 리스트 조회*/
	@GetMapping(value = "/mypage/vetInfo")
	public String getVetList(VetVO vo, Model model, UserVO user) {		
		
		System.out.println("수의사 리스트 조회할 때 getHospitalSeq==="+vo.getHospitalSeq());
		System.out.println("수의사 리스트 조회할 때 vo에 담긴 seq==="+vo.getHospitalSeq());

		int hospitalSeq = vo.getHospitalSeq();
		// 파일리스트 가져오기
		List<FileVO> fileList = fileService.getFileListByFreeBoardSeq(hospitalSeq);
//			
		model.addAttribute("vet",vetService.getVetList(vo));
		model.addAttribute("vetInfoFileList",fileList);
		model.addAttribute("user",user.getUserSeq());
		

		return "mypage-vetInfo";
	}
	
	/*수의사 등록 페이지로 이동*/
	@GetMapping("/mypage/newVetInfo")
	public String newVetInfo(UserVO user, Model model, VetVO vet) {
		
		model.addAttribute("user", user);
		model.addAttribute("vet", vet);
		System.out.println("수의사 등록페이지로 넘어왔을 때  getHospitalSeq==="+ vet.getHospitalSeq());
		
		return "mypage-vetAdd";
	}
	
	/*수의사 정보 등록*/
	@PostMapping("/mypage/insertVetInfo")
	public String insertVetInfo(VetVO vo,HttpServletRequest request, MultipartHttpServletRequest mhsr, UserVO user, Model model) throws IOException {
			
			vetService.insertVetInfo(vo);
			
			/* 파일 등록을 위한 코드*/
			int vetSeq = vetService.getVetSeq();
			String vetName = vo.getVetName();
			/*등록 폼의 보드 타입 지정*/
			PetFileUtils fileUtils = new PetFileUtils("p");
			List<FileVO> fileList = fileUtils.parseFileInfo(vetSeq, request, mhsr, vetName);
			
			if(CollectionUtils.isEmpty(fileList) == false) {
				fileService.insertPetFileList(fileList);
			}
			System.out.println("insertVetInfo 완");
			System.out.println(user.getUserSeq());
			System.out.println("vo.getVetSeq===" + vo.getVetSeq());
			System.out.println("vo.getHospitalSeq===" + vo.getHospitalSeq());
	
			model.addAttribute("vet", vo);
			model.addAttribute("user", user);
			
	
		return "redirect:/mypage/vetInfo?hospitalSeq="+ vo.getHospitalSeq();
	
	}
	

	
	/*수의사 정보 수정*/
	@GetMapping("/mypage/updateVetForm")
	/*Request Param seq값을 이용해 뷰에서 받는 파라미터값을 전달*/
		public String getVetInfo(VetVO vo, Model model, UserVO user) {
		
		model.addAttribute("vet",vetService.selectVetInfo(vo));
		model.addAttribute("user",user.getUserSeq());
		
		System.out.println("수의사정보 수정폼으로 왔을 때 VetVO===="+vo);
//		VetVO vet = vetService.selectVetInfo(vo);
	//	System.out.println("수의사정보 수정폼으로 왔을 때 service에서 VO====" + vet);

	//	model.addAttribute("hospitalSeq", vet.getHospitalSeq());
		//model.addAttribute("vet", vet);
	//	System.out.println("수의사 수정폼으로 넘어왔을 때  getHospitalSeq==="+ vo.getHospitalSeq());
		
			return "mypage-vetUpdate";
		}
	
	/*수의사 정보 수정폼에서 등록버튼*/
	@PostMapping("/mypage/updateVetInfo")
	public String updateVetInfo(VetVO vo) {
		System.out.println("내부로직탔");
		System.out.println("vo:" +vo);

		vetService.updateVetInfo(vo);	
		return "redirect:/mypage/vetInfo?hospitalSeq="+vo.getHospitalSeq();
	}
	
	
	/*수의사 정보 삭제*/
	@GetMapping("/mypage/deleteVetInfo")
	//@ResponseBody 리턴값을 html로 받지 않겠다 ..
	public String deleteVetInfo(@RequestParam("vetSeq") String vetSeq, VetVO vo) throws Exception{
		
		vetService.deleteVetInfo(Integer.parseInt(vetSeq));
		System.out.println("vetSeq=" +vetSeq);
		return "redirect:/mypage/vetInfo?hospitalSeq="+ vo.getHospitalSeq();
	}
	
	/**/
		
		
}