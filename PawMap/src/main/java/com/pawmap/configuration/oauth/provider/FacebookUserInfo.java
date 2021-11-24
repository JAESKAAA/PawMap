package com.pawmap.configuration.oauth.provider;

import java.util.Map;

public class FacebookUserInfo implements OAuth2UserInfo {

<<<<<<< HEAD
	private Map<String, Object> attributes; //getAttributes()Î•º Î∞õÏùå
=======
	private Map<String, Object> attributes; //getAttributes()∏¶ πﬁ¿Ω
>>>>>>> refs/remotes/origin/develop
	
	public FacebookUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}
	
	@Override
	public String getProviderId() {
		return (String)attributes.get("id");
	}

	@Override
	public String getProvider() {
		return "facebook";
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
