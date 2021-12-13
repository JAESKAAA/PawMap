package com.pawmap.controller;

import java.io.IOException;
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
import com.pawmap.VO.PetVO;
import com.pawmap.VO.UserVO;
import com.pawmap.service.FileService;
import com.pawmap.service.PetService;
import com.pawmap.service.UserService;
import com.pawmap.util.PetFileUtils;

@Controller
public class PetController {

	@Autowired
	private PetService petService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private UserService userService;
	

	/*반려동물 정보리스트 조회*/
	@GetMapping(value = "/mypage/petInfo")
	public String getPetList(@RequestParam String userId, PetVO vo, Model model, UserVO userVo, HttpServletRequest request) {
		
		System.out.println();
		
		model.addAttribute("pet",petService.getPetList(vo));
//		model.addAttribute("petWith",petService.getPetListWithoutFile(vo));
		model.addAttribute("user", userVo);		
		
		return "mypage-petInfo";
	}
	
	/*반려동물 정보 수정*/
	@GetMapping("/mypage/updatePetForm")
	/*Request Param seq값을 이용해 뷰에서 받는 파라미터값을 전달*/
	public String getPetInfo(PetVO vo, Model model, UserVO user) {
		System.out.println("vo ======= "+vo);
		
		PetVO pet = petService.selectPetInfo(vo);

		FileVO fileVO = fileService.getPetFile(vo.getPetSeq(), vo.getUserId());
		System.out.println("fileVO ======= "+ fileVO);
		
		model.addAttribute("fileVO", fileVO);
		model.addAttribute("pet", petService.selectPetInfo(vo));
		model.addAttribute("userId",pet.getUserId());
		model.addAttribute("user",user);
		System.out.println("반려동물 수정 폼으로 넘어갈 때사용자 아이디 " + vo.getUserId());
		
			
			return "mypage-petUpdate";
		}
	
	/*반려동물 정보 수정폼에서 등록버튼*/
	@PostMapping("/mypage/updatePetInfo")
	public String updatePetInfo(PetVO vo, UserVO user, Model model) {
		System.out.println("내부로직탔");
		System.out.println("vo ===================== :" +vo);
		System.out.println("user ======================= :" +user);
		vo.setStatus("N");
		
		
		petService.updatePetInfo(vo);
		System.out.println("업데이트 완료===== 사용자 아이디==="+user.getUserId());
		
//		List<FileVO> fileList = fileService.getFileListByUserId(vo.getUserId());
//		
//		if(CollectionUtils.isEmpty(fileList) == false) {
//			fileService.insertPetFileList(fileList);
//		}
//		
//		model.addAttribute("user",user);
		
		return "redirect:/mypage/petInfo?userId="+vo.getUserId();
	}
	
	
	/*반려동물 정보 수정 폼에서 사진 수정 */
	@RequestMapping("/mypage/updatePetInfoFormInsertFiles")
	public String updatePetInfoFormInsertFiles(String userId,HttpServletRequest request,
			MultipartHttpServletRequest mhsr, int fileSeq) throws IOException {
		
		System.out.println("updatePetInfoFormInsertFiles 들어옴");
		FileVO fileVo = new FileVO();
		PetFileUtils fileUtils = new PetFileUtils("p");
		System.out.println("fileSeq ================ "+ fileSeq);
		List<FileVO> fileList = fileUtils.parseFileInfo(fileSeq, request, mhsr,userId);
		
		System.out.println("fileVo.getBoardSeq==="+fileVo.getBoardSeq());
		System.out.println("fileList ======= "+fileList);
		
		fileService.updatePetFileList(fileList);

		return "redirect:updatePetForm?petSeq="+fileSeq + "&userId=" + userId;
		
	}
	
	/*반려동물 등록 페이지로 이동*/
	
	@GetMapping("/mypage/newPetInfo")
	public String newPetInfo(UserVO user, Model model) {
		model.addAttribute("user",user);
		System.out.println("반려동물 추가로 넘어왔을 때 사용자 아이디=====" + user.getUserId());
		return "mypage-petAdd";
	}
	/*반려동물 정보 등록*/
	@PostMapping("/mypage/insertPetInfo")
	public String registerPet(HttpServletRequest request,  PetVO vo, 
			MultipartHttpServletRequest mhsr , UserVO user, Model model) throws IOException {
			
			vo.setStatus("N");
			
			/* 파일 등록을 위한 코드*/
//			int boardSeq = petService.getPetSeq(userId);
			String userId = vo.getUserId();
//			System.out.println("fileUtils 가기전 petSeq =========== "+ boardSeq);
//
//			System.out.println("fileUtils 다녀와ㅅㅓpetSeq =========== "+ boardSeq);
			System.out.println("userId =========== "+userId);
			System.out.println("mhsr ================"+mhsr.getContentLength());
			System.out.println("request========" + request.toString());
	
			petService.insertPetInfo(vo);
			int boardSeq = petService.getPetSeq(userId);
			System.out.println("boardSeq================= "+ boardSeq);
		
			/*파일*/
			PetFileUtils fileUtils = new PetFileUtils("p");
			List<FileVO> fileList = fileUtils.parseFileInfo(boardSeq, request, mhsr,userId);			
			
			
			if(CollectionUtils.isEmpty(fileList) == false) {
				System.out.println("insertPetFileList 탄다=================");
				fileService.insertPetFileList(fileList);
				System.out.println("insertPetFileList 완료=================");
			}
	
		return "redirect:/mypage/petInfo?userId="+user.getUserId();
	
	}
	
	/*반려동물 정보 삭제*/
	@RequestMapping("/mypage/deletePetInfo")
	//@ResponseBody 리턴값을 html로 받지 않겠다 ..
	public String deletePetInfo(@RequestParam("petSeq") String petSeq,UserVO user,PetVO petVO, Model model) throws Exception{
		
		
		
		//model.getAttribute(userId);
		fileService.deletePetFile(petVO.getPetSeq(),petVO.getUserId());
		petService.deletePetInfo(petVO.getPetSeq(),petVO.getUserId());
		System.out.println("petSeq=" +petSeq);
		System.out.println("userId=" +user.getUserId());
		return "redirect:/mypage/petInfo?userId="+ user.getUserId();
	}

	
	@RequestMapping("/mypage/insertPetFileOnUpdateForm")
	public String insertPetFileOnUpdateForm(String userId, HttpServletRequest request,
			MultipartHttpServletRequest mhsr,String fileSeq) throws IOException {
		
		System.out.println("insertPetFileOnUpdateForm ===== 들어옴" );
		System.out.println("userId ======== "+userId);
		System.out.println("fileSeq ======== "+fileSeq);
		
		int seq = Integer.parseInt(fileSeq);
		
		PetFileUtils fileUtils = new PetFileUtils("p");
		
		List<FileVO> fileList = fileUtils.parseFileInfo(seq, request, mhsr,userId);
		System.out.println("fileList ========= "+ fileList);
		
		
		fileService.insertPetFileOnUpdateForm(fileList);

		return "redirect:updatePetForm?petSeq="+fileSeq + "&userId=" + userId;
		
		
		
	}
		
		
}