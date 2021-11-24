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

	//��ȿ�� �˻縦 ���� DI
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//���۷� ���� ���� userRequest �����Ϳ� ���� ��ó���Ǵ� �Լ�
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		//registrationId�� ���� � OAuth�� �α��� �ߴ��� Ȯ�� ������.
		System.out.println("getClientRegistration : " + userRequest.getClientRegistration()); 
		System.out.println("getAccessToken : " + userRequest.getAccessToken().getTokenValue());
		
		OAuth2User oauth2User = super.loadUser(userRequest);
		//���� �α��ι�ư Ŭ�� -> ���� �α���â -> �α��� �Ϸ� -> code ����(OAuth-Client���̺귯��) -> AccessToken��û �� ��ū ����. ��������� userRequest ����
		//userRequest������ ���� -> loadUser�Լ� ȣ�� -> ���۷κ��� ȸ�� �������� �޾���
		System.out.println("getAttributes : " + oauth2User.getAttributes());

		String userName = "";
		String providerId = "";
		//�Ҽ� �α��� ī�װ� ����
		OAuth2UserInfo oAuth2UserInfo = null;
		if(userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			System.out.println("���� �α��� ��û");
			oAuth2UserInfo = new GoogleUserInfo(oauth2User.getAttributes());
			userName = (String)oauth2User.getAttributes().get("name");
			providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("facebook")) {
			System.out.println("���̽��� �α��� ��û");
			oAuth2UserInfo = new FacebookUserInfo(oauth2User.getAttributes());
			userName = (String)oauth2User.getAttributes().get("name");
			providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
				System.out.println("���̹� �α��� ��û");
				oAuth2UserInfo = new NaverUserInfo((Map)oauth2User.getAttributes().get("response"));
				userName = oAuth2UserInfo.getName();
				providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
			System.out.println("īī�� �α��� ��û");
			oAuth2UserInfo = new KakaoUserInfo(oauth2User.getAttributes());
			providerId = oAuth2UserInfo.getProviderId();
			userName = oAuth2UserInfo.getName();
		
		}else {
			System.out.println("�츮�� ���۰� ���̽��ϰ� ���̹��� �����մϴ� !");
		}
		
		String provider = oAuth2UserInfo.getProvider(); //google
		String userId = provider +"_"+ providerId; //google_115880292448408069417
		String password = bCryptPasswordEncoder.encode(oAuth2UserInfo.getName());
		String email = oAuth2UserInfo.getEmail();
		String role = "ROLE_USER";
		
		//������ ���ԵǾ��ִ��� ��ȿ�� �˻�
		UserVO userEntity = userService.findByUsername(userId);
		
		System.out.println("userName===============" + userName);
		
		if(userEntity == null) {
			System.out.println("�Ҽ� �α����� �����Դϴ�.");
			userEntity = UserVO.builder()
					.userId(userId)
					.userPassword(password)
					.userName(userName)
					.userEmail(email)
					.role(role)
					.provider(provider)
					.providerId(providerId)
					.build();
					
			//���⼭ DB�� �����
			userService.socialJoin(userEntity);
		}else {
			System.out.println("�Ҽ� �α����� �̹� �����Ͽ�, �ڵ� ȸ�������� �Ǿ� �ֽ��ϴ�.");
		}
			return new PrincipalDetails(userEntity, oauth2User.getAttributes());
		}
	
}
