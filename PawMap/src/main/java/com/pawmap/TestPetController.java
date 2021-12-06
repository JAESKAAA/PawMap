//package com.pawmap;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.pawmap.VO.PetVO;
//import com.pawmap.mapper.PetMapper;
//
//@SpringBootTest
//public class TestPetController {
//	
//	
//	@Autowired
//	private PetMapper petMapper;
//
//	@Test
//	public void testOfInsert() {
//		PetVO params = new PetVO();
//		
//		params.setUserId("112345");
//		params.setPetName("미남");
//		params.setPetGender("남");
//		params.setPetAge("12");
//		params.setPetType("강아지");
//		params.setPetTypeDetail("요크셔");
//		params.setSymptom("발바닥 습진");
//		params.setStatus("N");
//
//		int result = petMapper.insertPetInfo(params);
//		System.out.println("결과는 " + result + "입니다.");
//	}
//	
//	@Test
//	public void testOfSelectDetail() {
//		PetVO pet = petMapper.selectPetInfo((long) 1);
//		try {
//			String boardJson = new ObjectMapper().writeValueAsString(pet);
//
//			System.out.println("=========================");
//			System.out.println(boardJson);
//			System.out.println("=========================");
//
//		} catch (JsonProcessingException e) {
//			e.printStackTrace();
//		}
//	}
//
//@Test
//	public void testOfUpdate() {
//		PetVO params = new PetVO();
//		params.setPetName("미남2");
//		params.setPetGender("남2");
//		params.setPetAge("122");
//		params.setPetType("강아지2");
//		params.setPetTypeDetail("요크셔2");
//		params.setSymptom("발바닥 습진2");
//
//
//		int result = petMapper.updatePetInfo(params);
//		if (result == 1) {
//			PetVO pet = petMapper.selectPetInfo((long) 1);
//			try {
//				String petJson = new ObjectMapper().writeValueAsString(pet);
//
//				System.out.println("=========================");
//				System.out.println(petJson);
//				System.out.println("=========================");
//
//			} catch (JsonProcessingException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//
//@Test
//	public void testOfDelete() {
//		int result = petMapper.deletePetInfo((int) 1);
//		if (result == 1) {
//			PetVO pet = petMapper.selectPetInfo((long) 1);
//			try {
//				String petJson = new ObjectMapper().writeValueAsString(pet);
//
//				System.out.println("=========================");
//				System.out.println(petJson);
//				System.out.println("=========================");
//
//			} catch (JsonProcessingException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//
//}