package com.pawmap.configuration.oauth.provider;

//���� �Ҽȷα����� �ٷ�� ���� �������̽�
public interface OAuth2UserInfo {

	String getProviderId();
	String getProvider();
	String getEmail();
	String getName();
	
}
