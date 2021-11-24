package com.pawmap.configuration.oauth.provider;

import java.util.Map;

public class NaverUserInfo implements OAuth2UserInfo {

<<<<<<< HEAD
	private Map<String, Object> attributes; //getAttributes()ë¥¼ ë°›ìŒ
=======
	private Map<String, Object> attributes; //getAttributes()¸¦ ¹ŞÀ½
>>>>>>> refs/remotes/origin/develop
	
	public NaverUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}
	
	@Override
	public String getProviderId() {
		return (String)attributes.get("id");
	}

	@Override
	public String getProvider() {
		return "naver";
	}

	@Override
	public String getEmail() {
		return (String)attributes.get("email");
	}

	@Override
	public String getName() {
		return (String)attributes.get("name");
	}


	
}
