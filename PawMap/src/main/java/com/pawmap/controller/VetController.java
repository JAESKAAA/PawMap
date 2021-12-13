package com.pawmap.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pawmap.VO.FileVO;
import com.pawmap.VO.HospitalVO;
import com.pawmap.VO.UserVO;
import com.pawmap.VO.VetVO;
import com.pawmap.service.FileService;
import com.pawmap.service.UserService;
import com.pawmap.service.VetService;
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
		
		//1. 병원 데이터 뽑아와서 seq 설정해주는 부분 (hospital_data 테이블의 seq를 가져와야함)
		HospitalVO hospitalVO = vetService.getHospitalInfo(user);
		System.out.println("hospitalVO 정보 ==> "+hospitalVO);
		//2. 해당 병원 seq저장
		int hospitalSeq = hospitalVO.getHospitalSeq();
		//3. 수의사 vo에 병원 seq주입
		vo.setHospitalSeq(hospitalSeq);
		
		System.out.println("user정보 마이페이지 -> "+user);
		System.out.println("수의사 정보 마이페이지 -> "+vo);
		System.out.println("수의사 VO의 seq정보 -> "+vo.getHospitalSeq());
		

		// 파일리스트 가져오기
		List<FileVO> fileList = fileService.getFileListByFreeBoardSeq(hospitalSeq);
			
		model.addAttribute("hospital", hospitalVO);
		model.addAttribute("vet",vetService.getVetListWithFiles(vo));
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
			
			System.out.println("넘어온 병원 유저 정보 == "+user);
			System.out.println("넘어온 수의사 정보 == "+vo);
			HospitalVO hospitalVO = vetService.getHospitalInfo(user);
			
			 vo.setHospitalSeq(hospitalVO.getHospitalSeq());
			 int hospitalSeq = vo.getHospitalSeq();
			 System.out.println("입력받은 병원 seq == > "+vo.getHospitalSeq());
			
		
			vetService.insertVetInfo(vo);
			
			/* 파일 등록을 위한 코드*/
			int vetSeq = vetService.getMaxVetSeq(hospitalSeq);
			System.out.println("vetSeq 값 ===>"+vetSeq);
			String hospitalName = user.getUserId();
			System.out.println("제휴병원 아이디 == "+hospitalName);
			
			/*등록 폼의 보드 타입 지정*/
			PetFileUtils fileUtils = new PetFileUtils("v");
			List<FileVO> fileList = fileUtils.parseFileInfo(vetSeq, request, mhsr, hospitalName);
			
			if(CollectionUtils.isEmpty(fileList) == false) {
				System.out.println("파일 저장됨");
				fileService.insertVetFileList(fileList);
			}
			System.out.println("insertVetInfo 완");
	
			model.addAttribute("vet", vo);
			model.addAttribute("user", user);
			
			System.out.println("user 아이디 정보 == "+user.getUserId());
			String encodedParam = URLEncoder.encode(user.getUserId(), "UTF-8");
		return "redirect:/mypage/vetInfo?userId="+encodedParam;
	
	}
	

	
	/*수의사 정보 수정*/
	@GetMapping("/mypage/updateVetForm")
	/*Request Param seq값을 이용해 뷰에서 받는 파라미터값을 전달*/
		public String getVetInfo(VetVO vo, Model model, UserVO user) {
		
		FileVO file = new FileVO();
		file.setUserId(user.getUserId());
		file.setBoardType("v");
		file.setBoardSeq(vo.getVetSeq());
		System.out.println("file === "+file);
		
		FileVO fileVO = fileService.vetInfoFile(file);
		System.out.println("fileVO ======= "+ fileVO);
		
		model.addAttribute("fileVO", fileVO);
		model.addAttribute("vet",vetService.selectVetInfo(vo));
		model.addAttribute("user",user.getUserSeq());
		
		System.out.println("수의사정보 수정폼으로 왔을 때 VetVO===="+vo);
		
			return "mypage-vetUpdate";
		}
	
	/*수의사 정보 수정 폼에서 사진 수정 */
	@RequestMapping("/mypage/updateVetInfoFormInsertFiles")
	public String updateVetInfoFormInsertFiles(UserVO user,HttpServletRequest request,
			MultipartHttpServletRequest mhsr, int fileSeq, VetVO vo) throws IOException {
		
		//fileList를 만들기위한 정보 추출 (vetSeq, hospital_data에 userId, userId 등등)
		HospitalVO hospitalVO = vetService.getHospitalInfo(user);
		int hospitalSeq = hospitalVO.getHospitalSeq();
		int vetSeq = vo.getVetSeq();
		String hospitalName = user.getUserId();
		FileVO fileVo = new FileVO();
		PetFileUtils fileUtils = new PetFileUtils("v");
		
		List<FileVO> fileList = fileUtils.parseFileInfo(vetSeq, request, mhsr,hospitalName);
		
		//파일 한개만이라고 가정
		fileList.get(0).setFileSeq(fileSeq);
		
		System.out.println("fileList ======= "+fileList);
		
		fileService.updateVetFileList(fileList);

		return "redirect:updateVetForm?vetSeq="+vetSeq + "&hospitalSeq=" + hospitalSeq;
		
	}
	
	//수의사 정보 수정페이지에서 사진 없을때 타는 메소드
	@RequestMapping("/mypage/insertVetFileOnUpdateForm")
	public String insertPetFileOnUpdateForm(UserVO user, HttpServletRequest request,
			MultipartHttpServletRequest mhsr,String fileSeq, VetVO vo) throws IOException {
		
		//file리스트 추출을 위한 정보
		HospitalVO hospitalVO = vetService.getHospitalInfo(user);
		int hospitalSeq = hospitalVO.getHospitalSeq();
		int vetSeq = vo.getVetSeq();
		String hospitalName = user.getUserId();
		
		/*등록 폼의 보드 타입 지정*/
		PetFileUtils fileUtils = new PetFileUtils("v");
		List<FileVO> fileList = fileUtils.parseFileInfo(vetSeq, request, mhsr, hospitalName);
		
		if(CollectionUtils.isEmpty(fileList) == false) {
			System.out.println("파일 저장됨");
			System.out.println("파일리스트 정보 == "+fileList);
			fileService.insertVetFileList(fileList);
		}

		return "redirect:updateVetForm?vetSeq="+vetSeq + "&hospitalSeq=" + hospitalSeq;
	}
	
	/*수의사 정보 수정폼에서 등록버튼*/
	@PostMapping("/mypage/updateVetInfo")
	public String updateVetInfo(VetVO vo, UserVO user) throws IOException {
		System.out.println("내부로직탔");
		System.out.println("vo:" +vo);

		vetService.updateVetInfo(vo);	
		
		String encodedParam = URLEncoder.encode(user.getUserId(), "UTF-8");

		return "redirect:/mypage/vetInfo?userId="+encodedParam;
	}
	
	
	/*수의사 정보 삭제*/
	@GetMapping("/mypage/deleteVetInfo")
	//@ResponseBody 리턴값을 html로 받지 않겠다 ..
	public String deleteVetInfo(@RequestParam("vetSeq") String vetSeq, String hospitalSeq, UserVO user) throws Exception{
		
		System.out.println("vetSeq=" +vetSeq);
		System.out.println("hospitalSeq=" +hospitalSeq);
		fileService.deleteVetFile(Integer.parseInt(vetSeq), "v", user.getUserId());
		vetService.deleteVetInfo(Integer.parseInt(vetSeq), Integer.parseInt(hospitalSeq));
		String encodedParam = URLEncoder.encode(user.getUserId(), "UTF-8");
		System.out.println("딜리트에서 유저정보 = "+user.getUserId());
		return "redirect:/mypage/vetInfo?userId="+encodedParam;
	}
	
	/**/
		
		
}