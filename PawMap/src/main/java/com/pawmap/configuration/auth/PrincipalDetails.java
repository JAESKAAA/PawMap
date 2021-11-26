package com.pawmap.configuration.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.pawmap.VO.UserVO;

import lombok.Data;

/*
 * 시큐리티가 "/login" 요청을 낚아채서 로그인을 진행시킴
 * 로그인 진행이 완료되면 시큐리티 session을 만들어 줌. (Security ContextHolder(키값임))
 * Security가 가지고있는 세션에 들어갈 수 있는 오브젝트는 한정되어 있음 (하기참고)
 * Object => Authentication 타입 객체
 * Authentication 객체 안에 User정보가 있어야함
 * User오브젝트의 타입 => UserDetails 타입 객체여야함
 * 
 * Security Session => Authentication => UserDetails 타입이어야함
 */

@Data
public class PrincipalDetails implements UserDetails, OAuth2User {

	private UserVO user; //컴포지션
	
	//소셜로그인 정보를 담기위한 맵
	private Map<String, Object> attributes;
	
	//일반로그인시 사용될 생성자

	public PrincipalDetails(UserVO user) {
		this.user = user;
	}


	//OAuth 로그인시 사용될 생성자
	public PrincipalDetails(UserVO user, Map<String, Object> attributes) {
		this.user = user;
		this.attributes = attributes;
	}
	
	
	//해당 User의 권한을 리턴하는 곳
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		//리턴타입이 Collection으로 받기 떄문에, 현재 String으로 되어있는 UserVO의 type 변수를 collction타입으로 변경해줘야함(하기참고)
		Collection<GrantedAuthority> collect = new ArrayList<>();
		collect.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {
				return user.getRole();
			}
		});
		
		return collect;
	}

	@Override
	public String getPassword() {
		return user.getUserPassword();
	}

	@Override
	public String getUsername() {
		return user.getUserName();
	}

	//계정 만료여부
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	//계정 잠금 여부
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	//계정 비밀번호 유효기간 지났는지 확인하는 것
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	//계정 활성화 여부
	@Override
	public boolean isEnabled() {
		
		//우리 사이트에서 1년동안 회원이 로그인을 안하면 휴먼 계정으로 하기로 했을 경우,
		//DB속성에 loginDate(Timestamp로) 만들어서 검증 할 수 있음 (하기 예시 참고)
		//user.getLoginDate(); -> 현재 시간-로그인시간 => 1년 초과시 return false;
		
		return true;
	}


	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}


	@Override
	public String getName() {
		System.out.println("principalDetails의 username=="+user.getUserName());
		return null;
	}

	
}
