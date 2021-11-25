package com.pawmap.configuration.oauth.provider;

//여러 소셜로그인을 다루기 위한 인터페이스
public interface OAuth2UserInfo {

	String getProviderId();
	String getProvider();
	String getEmail();
	String getName();
	
}