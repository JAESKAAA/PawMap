package com.pawmap.configuration.oauth;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.pawmap.VO.UserVO;
import com.pawmap.configuration.auth.PrincipalDetails;
import com.pawmap.configuration.oauth.provider.FacebookUserInfo;
import com.pawmap.configuration.oauth.provider.GoogleUserInfo;
import com.pawmap.configuration.oauth.provider.KakaoUserInfo;
import com.pawmap.configuration.oauth.provider.NaverUserInfo;
import com.pawmap.configuration.oauth.provider.OAuth2UserInfo;
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

		String userName = "";
		String providerId = "";
		//소셜 로그인 카테고리 검증
		OAuth2UserInfo oAuth2UserInfo = null;
		if(userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			System.out.println("구글 로그인 요청");
			oAuth2UserInfo = new GoogleUserInfo(oauth2User.getAttributes());
			userName = (String)oauth2User.getAttributes().get("name");
			providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("facebook")) {
			System.out.println("페이스북 로그인 요청");
			oAuth2UserInfo = new FacebookUserInfo(oauth2User.getAttributes());
			userName = (String)oauth2User.getAttributes().get("name");
			providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
				System.out.println("네이버 로그인 요청");
				oAuth2UserInfo = new NaverUserInfo((Map)oauth2User.getAttributes().get("response"));
				userName = oAuth2UserInfo.getName();
				providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
			System.out.println("카카오 로그인 요청");
			oAuth2UserInfo = new KakaoUserInfo(oauth2User.getAttributes());
			providerId = oAuth2UserInfo.getProviderId();
			userName = oAuth2UserInfo.getName();
		
		}else {
			System.out.println("우리는 구글과 페이스북과 네이버만 지원합니다 !");
		}
		
		String provider = oAuth2UserInfo.getProvider(); //google
		String userId = provider +"_"+ providerId; //google_115880292448408069417
		String password = bCryptPasswordEncoder.encode(oAuth2UserInfo.getName());
		String email = oAuth2UserInfo.getEmail();
		String role = "ROLE_USER";
		
		//유저가 가입되어있는지 유효성 검사
		UserVO userEntity = userService.findByUsername(userId);
		
		System.out.println("userName===============" + userName);
		
		if(userEntity == null) {
			System.out.println("소셜 로그인이 최초입니다.");
			userEntity = UserVO.builder()
					.userId(userId)
					.userPassword(password)
					.userName(userName)
					.userEmail(email)
					.role(role)
					.provider(provider)
					.providerId(providerId)
					.build();
					
			//여기서 DB에 저장됨
			userService.socialJoin(userEntity);
		}else {
			System.out.println("소셜 로그인을 이미 진행하여, 자동 회원가입이 되어 있습니다.");
		}
			return new PrincipalDetails(userEntity, oauth2User.getAttributes());
		}
	
}