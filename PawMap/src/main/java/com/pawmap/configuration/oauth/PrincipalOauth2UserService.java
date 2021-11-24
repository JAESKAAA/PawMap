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

<<<<<<< HEAD
	//ìœ íš¨ì„± ê²€ì‚¬ë¥¼ ìœ„í•œ DI
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//êµ¬ê¸€ë¡œ ë¶€í„° ë°›ì€ userRequest ë°ì´í„°ì— ëŒ€í•œ í›„ì²˜ë¦¬ë˜ëŠ” í•¨ìˆ˜
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		//registrationIdë¥¼ í†µí•´ ì–´ë–¤ OAuthë¡œ ë¡œê·¸ì¸ í–ˆëŠ”ì§€ í™•ì¸ ê°€ëŠ¥í•¨.
		System.out.println("getClientRegistration : " + userRequest.getClientRegistration()); 
		System.out.println("getAccessToken : " + userRequest.getAccessToken().getTokenValue());
		
		OAuth2User oauth2User = super.loadUser(userRequest);
		//êµ¬ê¸€ ë¡œê·¸ì¸ë²„íŠ¼ í´ë¦­ -> êµ¬ê¸€ ë¡œê·¸ì¸ì°½ -> ë¡œê·¸ì¸ ì™„ë£Œ -> code ë¦¬í„´(OAuth-Clientë¼ì´ë¸ŒëŸ¬ë¦¬) -> AccessTokenìš”ì²­ í›„ í† í° ìˆ˜ë ¹. ì—¬ê¸°ê¹Œì§€ê°€ userRequest ì •ë³´
		//userRequestì •ë³´ë¥¼ í†µí•´ -> loadUserí•¨ìˆ˜ í˜¸ì¶œ -> êµ¬ê¸€ë¡œë¶€í„° íšŒì› í”„ë¡œí•„ì„ ë°›ì•„ì¤Œ
		System.out.println("getAttributes : " + oauth2User.getAttributes());

		String userName = "";
		String providerId = "";
		//ì†Œì…œ ë¡œê·¸ì¸ ì¹´í…Œê³ ë¦¬ ê²€ì¦
		OAuth2UserInfo oAuth2UserInfo = null;
		if(userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			System.out.println("êµ¬ê¸€ ë¡œê·¸ì¸ ìš”ì²­");
			oAuth2UserInfo = new GoogleUserInfo(oauth2User.getAttributes());
			userName = (String)oauth2User.getAttributes().get("name");
			providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("facebook")) {
			System.out.println("íŽ˜ì´ìŠ¤ë¶ ë¡œê·¸ì¸ ìš”ì²­");
			oAuth2UserInfo = new FacebookUserInfo(oauth2User.getAttributes());
			userName = (String)oauth2User.getAttributes().get("name");
			providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
				System.out.println("ë„¤ì´ë²„ ë¡œê·¸ì¸ ìš”ì²­");
				oAuth2UserInfo = new NaverUserInfo((Map)oauth2User.getAttributes().get("response"));
				userName = oAuth2UserInfo.getName();
				providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
			System.out.println("ì¹´ì¹´ì˜¤ ë¡œê·¸ì¸ ìš”ì²­");
			oAuth2UserInfo = new KakaoUserInfo(oauth2User.getAttributes());
			providerId = oAuth2UserInfo.getProviderId();
			userName = oAuth2UserInfo.getName();
		
		}else {
			System.out.println("ìš°ë¦¬ëŠ” êµ¬ê¸€ê³¼ íŽ˜ì´ìŠ¤ë¶ê³¼ ë„¤ì´ë²„ë§Œ ì§€ì›í•©ë‹ˆë‹¤ !");
		}
		
		String provider = oAuth2UserInfo.getProvider(); //google
		String userId = provider +"_"+ providerId; //google_115880292448408069417
		String password = bCryptPasswordEncoder.encode(oAuth2UserInfo.getName());
		String email = oAuth2UserInfo.getEmail();
		String role = "ROLE_USER";
		
		//ìœ ì €ê°€ ê°€ìž…ë˜ì–´ìžˆëŠ”ì§€ ìœ íš¨ì„± ê²€ì‚¬
		UserVO userEntity = userService.findByUsername(userId);
		
		System.out.println("userName===============" + userName);
		
		if(userEntity == null) {
			System.out.println("ì†Œì…œ ë¡œê·¸ì¸ì´ ìµœì´ˆìž…ë‹ˆë‹¤.");
			userEntity = UserVO.builder()
					.userId(userId)
					.userPassword(password)
					.userName(userName)
					.userEmail(email)
					.role(role)
					.provider(provider)
					.providerId(providerId)
					.build();
					
			//ì—¬ê¸°ì„œ DBì— ì €ìž¥ë¨
			userService.socialJoin(userEntity);
		}else {
			System.out.println("ì†Œì…œ ë¡œê·¸ì¸ì„ ì´ë¯¸ ì§„í–‰í•˜ì—¬, ìžë™ íšŒì›ê°€ìž…ì´ ë˜ì–´ ìžˆìŠµë‹ˆë‹¤.");
=======
	//À¯È¿¼º °Ë»ç¸¦ À§ÇÑ DI
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//±¸±Û·Î ºÎÅÍ ¹ÞÀº userRequest µ¥ÀÌÅÍ¿¡ ´ëÇÑ ÈÄÃ³¸®µÇ´Â ÇÔ¼ö
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		//registrationId¸¦ ÅëÇØ ¾î¶² OAuth·Î ·Î±×ÀÎ Çß´ÂÁö È®ÀÎ °¡´ÉÇÔ.
		System.out.println("getClientRegistration : " + userRequest.getClientRegistration()); 
		System.out.println("getAccessToken : " + userRequest.getAccessToken().getTokenValue());
		
		OAuth2User oauth2User = super.loadUser(userRequest);
		//±¸±Û ·Î±×ÀÎ¹öÆ° Å¬¸¯ -> ±¸±Û ·Î±×ÀÎÃ¢ -> ·Î±×ÀÎ ¿Ï·á -> code ¸®ÅÏ(OAuth-Client¶óÀÌºê·¯¸®) -> AccessToken¿äÃ» ÈÄ ÅäÅ« ¼ö·É. ¿©±â±îÁö°¡ userRequest Á¤º¸
		//userRequestÁ¤º¸¸¦ ÅëÇØ -> loadUserÇÔ¼ö È£Ãâ -> ±¸±Û·ÎºÎÅÍ È¸¿ø ÇÁ·ÎÇÊÀ» ¹Þ¾ÆÁÜ
		System.out.println("getAttributes : " + oauth2User.getAttributes());

		String userName = "";
		String providerId = "";
		//¼Ò¼È ·Î±×ÀÎ Ä«Å×°í¸® °ËÁõ
		OAuth2UserInfo oAuth2UserInfo = null;
		if(userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			System.out.println("±¸±Û ·Î±×ÀÎ ¿äÃ»");
			oAuth2UserInfo = new GoogleUserInfo(oauth2User.getAttributes());
			userName = (String)oauth2User.getAttributes().get("name");
			providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("facebook")) {
			System.out.println("ÆäÀÌ½ººÏ ·Î±×ÀÎ ¿äÃ»");
			oAuth2UserInfo = new FacebookUserInfo(oauth2User.getAttributes());
			userName = (String)oauth2User.getAttributes().get("name");
			providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
				System.out.println("³×ÀÌ¹ö ·Î±×ÀÎ ¿äÃ»");
				oAuth2UserInfo = new NaverUserInfo((Map)oauth2User.getAttributes().get("response"));
				userName = oAuth2UserInfo.getName();
				providerId = oAuth2UserInfo.getProviderId();
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
			System.out.println("Ä«Ä«¿À ·Î±×ÀÎ ¿äÃ»");
			oAuth2UserInfo = new KakaoUserInfo(oauth2User.getAttributes());
			providerId = oAuth2UserInfo.getProviderId();
			userName = oAuth2UserInfo.getName();
		
		}else {
			System.out.println("¿ì¸®´Â ±¸±Û°ú ÆäÀÌ½ººÏ°ú ³×ÀÌ¹ö¸¸ Áö¿øÇÕ´Ï´Ù !");
		}
		
		String provider = oAuth2UserInfo.getProvider(); //google
		String userId = provider +"_"+ providerId; //google_115880292448408069417
		String password = bCryptPasswordEncoder.encode(oAuth2UserInfo.getName());
		String email = oAuth2UserInfo.getEmail();
		String role = "ROLE_USER";
		
		//À¯Àú°¡ °¡ÀÔµÇ¾îÀÖ´ÂÁö À¯È¿¼º °Ë»ç
		UserVO userEntity = userService.findByUsername(userId);
		
		System.out.println("userName===============" + userName);
		
		if(userEntity == null) {
			System.out.println("¼Ò¼È ·Î±×ÀÎÀÌ ÃÖÃÊÀÔ´Ï´Ù.");
			userEntity = UserVO.builder()
					.userId(userId)
					.userPassword(password)
					.userName(userName)
					.userEmail(email)
					.role(role)
					.provider(provider)
					.providerId(providerId)
					.build();
					
			//¿©±â¼­ DB¿¡ ÀúÀåµÊ
			userService.socialJoin(userEntity);
		}else {
			System.out.println("¼Ò¼È ·Î±×ÀÎÀ» ÀÌ¹Ì ÁøÇàÇÏ¿©, ÀÚµ¿ È¸¿ø°¡ÀÔÀÌ µÇ¾î ÀÖ½À´Ï´Ù.");
>>>>>>> refs/remotes/origin/develop
		}
			return new PrincipalDetails(userEntity, oauth2User.getAttributes());
		}
	
}
