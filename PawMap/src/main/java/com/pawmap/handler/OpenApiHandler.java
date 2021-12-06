package com.pawmap.handler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.pawmap.VO.HospitalVO;
import com.pawmap.mapper.SearchMapper;

/*
	OPEN API 데이터를 저장하는 클래스입니다.
	OPEN API 서버측 제한사항으로 데이터는 1회당 1,000건 까지만 조회가능 합니다.
	추후 여유가 되면 기능 별로 메소드 나눠줄 예정입니다.
*/

@Component
public class OpenApiHandler {
	
	@Autowired
	private SearchMapper searchMapper;
	
	final static private String URL = "http://openapi.seoul.go.kr:8088";
	//properties에서 key받아오도록 설정
	@Value("${openApi.key}")
	private String app_key;
	final static private String TYPE ="json";
	final static private String METHOD_NAME = "LOCALDATA_020301";

	public void handleHospitalInfo() throws IOException, Exception {
		/*
		 * 데이터 조회되는 부분
		 */		
		
		//데이터는 한번에 1000개까지만 OpenAPI에서 조회 가능함
		String startPage = "2001";
		String endPage = "2013";
		
		List<String> params = Arrays.asList(URL,app_key,TYPE,METHOD_NAME,startPage,endPage);
		
		// 상기 params를 문자로 붙여주는 코드
		String totalUrl = params.stream().collect(Collectors.joining("/"));
	
		StringBuilder result = new StringBuilder();
		URL requestUrl = new URL(totalUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader bf;
		bf = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
		String returnLine;
		
		while((returnLine = bf.readLine())!= null) {
			result.append(returnLine+"\n\r");
		}
		

		/*
		 * 데이터 파싱하는 부분
		 */		
		
		//파싱객체 생성
		JSONParser jsonParser = new JSONParser();
		//파싱할 String을 JSON 객체로 파서를 통해 저장
		JSONObject jsonObj = (JSONObject) jsonParser.parse(result.toString());
	
		//데이터 분해하는 부분
		//response를 받아옴
		JSONObject parseResponse = (JSONObject) jsonObj.get("LOCALDATA_020301");
		JSONArray parseRow = (JSONArray) parseResponse.get("row");
		System.out.println("parseRow 사이즈 : "+parseRow.size());
		
		/*
		 * 데이터 DB에 저장되는 부분
		 */		
		
		//HospitalVO에 파싱된 값을 넣어줌
		HospitalVO vo = new HospitalVO();
		
		for(Object parseValue : parseRow) {
			
			JSONObject value = (JSONObject) parseValue;
			
			vo.setHospitalId((String) value.get("MGTNO"));
			vo.setHospitalName((String) value.get("BPLCNM"));
			vo.setHospitalAddress((String) value.get("RDNWHLADDR"));
			vo.setHospitalStatusCode((String) value.get("TRDSTATEGBN"));
			vo.setHospitalTelNum((String) value.get("SITETEL"));
			
 			//숫자가 9자리 이하면 앞에 지역번호 02 붙여주기 (일단 1차적으로 걸러서 DB에 값을 넣고 DB내에서 유효하지않은 값은 2차로 제거하는 작업 필요합니다.)
 			if(vo.getHospitalTelNum().length() <10) {
 				vo.setHospitalTelNum("02-"+vo.getHospitalTelNum());
 				
 			}
 			//SQL문 타서 DB에 저장되는 부분
 			searchMapper.insertHospitalData(vo);
		}
	}
	
}
