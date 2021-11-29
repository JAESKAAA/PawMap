package com.pawmap.configuration.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.pawmap.VO.UserVO;
import com.pawmap.configuration.auth.PrincipalDetails;
import com.pawmap.service.UserService;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{

	//유효성 검사를 위한 DI
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//구글로 부터 받은 userRequest 데이터에 대한 후처리되는 함수
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		//registrationId를 통해 어떤 OAuth로 로그인 했는지 확인 가능함.
		System.out.println("getClientRegistration : " + userRequest.getClientRegistration()); 
		System.out.println("getAccessToken : " + userRequest.getAccessToken().getTokenValue());
		
		OAuth2User oauth2User = super.loadUser(userRequest);
		//구글 로그인버튼 클릭 -> 구글 로그인창 -> 로그인 완료 -> code 리턴(OAuth-Client라이브러리) -> AccessToken요청 후 토큰 수령. 여기까지가 userRequest 정보
		//userRequest정보를 통해 -> loadUser함수 호출 -> 구글로부터 회원 프로필을 받아줌
		System.out.println("getAttributes : " + oauth2User.getAttributes());
		
		String provider = userRequest.getClientRegistration().getClientName(); //google
		String providerId = oauth2User.getAttribute("sub");
		String userId = provider +"_"+ providerId; //google_115880292448408069417
		String userName = (String)oauth2User.getAttributes().get("name");
		String password = bCryptPasswordEncoder.encode((String)oauth2User.getAttributes().get("name"));
		String email = oauth2User.getAttribute("email");
		String role = "ROLE_USER";
		
		//유저가 가입되어있는지 유효성 검사
		UserVO userEntity = userService.findByUsername(userId);
		
		if(userEntity == null) {
			System.out.println("구글 로그인이 최초입니다.");
			userEntity = UserVO.builder()
					.userId(userId)
					.userPassword(password)
					.userName(userName)
					.userEmail(email)
					.role(role)
					.provider(provider)
					.providerId(providerId)
					.build();
					
			userService.socialJoin(userEntity);
		}else {
			System.out.println("구글 로그인을 이미 진행하여, 자동 회원가입이 되어 있습니다.");
		}
		
		/*
		 * 소셜 계정을 통한 회원가입
		 * username = google_(sub id값)
		 * password = "암호화(pw)"
		 * email = 프로필에 등록된 email정보
		 * role = "ROLE_USER"
		 * provider = "google" //하기 두개 속성은 DB에 추가해야함
		 * providerId = sub id값
		 * 
		 * */
		
		return new PrincipalDetails(userEntity, oauth2User.getAttributes());
	}
}
