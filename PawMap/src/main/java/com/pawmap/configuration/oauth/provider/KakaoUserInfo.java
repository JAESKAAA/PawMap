package com.pawmap.configuration.oauth.provider;

import java.util.Map;

public class KakaoUserInfo implements OAuth2UserInfo {

	private Map<String, Object> attributes; //getAttributes()¸¦ ¹ÞÀ½
	private Map<String, Object> properties;
	
	public KakaoUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
		this.properties = (Map<String, Object>) attributes.get("kakao_account");
	}
	

	@Override
	public String getProviderId() {
		return attributes.get("id")+"";
	}

	@Override
	public String getProvider() {
		return "kakao";
	}

	@Override
	public String getEmail() {
		return (String)properties.get("email");
	}

	@Override
	public String getName() {
		Map profile = (Map)properties.get("profile");
		return (String)profile.get("nickname");
	}


	
}