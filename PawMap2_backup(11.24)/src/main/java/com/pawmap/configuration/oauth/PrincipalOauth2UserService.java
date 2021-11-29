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
		
		String provider = userRequest.getClientRegistration().getClientName(); //google
		String providerId = oauth2User.getAttribute("sub");
		String userId = provider +"_"+ providerId; //google_115880292448408069417
		String userName = (String)oauth2User.getAttributes().get("name");
		String password = bCryptPasswordEncoder.encode((String)oauth2User.getAttributes().get("name"));
		String email = oauth2User.getAttribute("email");
		String role = "ROLE_USER";
		
		//������ ���ԵǾ��ִ��� ��ȿ�� �˻�
		UserVO userEntity = userService.findByUsername(userId);
		
		if(userEntity == null) {
			System.out.println("���� �α����� �����Դϴ�.");
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
			System.out.println("���� �α����� �̹� �����Ͽ�, �ڵ� ȸ�������� �Ǿ� �ֽ��ϴ�.");
		}
		
		/*
		 * �Ҽ� ������ ���� ȸ������
		 * username = google_(sub id��)
		 * password = "��ȣȭ(pw)"
		 * email = �����ʿ� ��ϵ� email����
		 * role = "ROLE_USER"
		 * provider = "google" //�ϱ� �ΰ� �Ӽ��� DB�� �߰��ؾ���
		 * providerId = sub id��
		 * 
		 * */
		
		return new PrincipalDetails(userEntity, oauth2User.getAttributes());
	}
}
