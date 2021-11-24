package com.pawmap.configuration.oauth.provider;

import java.util.Map;

public class GoogleUserInfo implements OAuth2UserInfo {

<<<<<<< HEAD
	private Map<String, Object> attributes; //getAttributes()를 받음
=======
	private Map<String, Object> attributes; //getAttributes()�� ����
>>>>>>> refs/remotes/origin/develop
	
	public GoogleUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}
	
	@Override
	public String getProviderId() {
		return (String)attributes.get("sub");
	}

	@Override
	public String getProvider() {
		return "google";
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
