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
 * ��ť��Ƽ�� "/login" ��û�� ����ä�� �α����� �����Ŵ
 * �α��� ������ �Ϸ�Ǹ� ��ť��Ƽ session�� ����� ��. (Security ContextHolder(Ű����))
 * Security�� �������ִ� ���ǿ� �� �� �ִ� ������Ʈ�� �����Ǿ� ���� (�ϱ�����)
 * Object => Authentication Ÿ�� ��ü
 * Authentication ��ü �ȿ� User������ �־����
 * User������Ʈ�� Ÿ�� => UserDetails Ÿ�� ��ü������
 * 
 * Security Session => Authentication => UserDetails Ÿ���̾����
 */

@Data
public class PrincipalDetails implements UserDetails, OAuth2User {

	private UserVO user; //��������
	
	//�Ҽȷα��� ������ ������� ��
	private Map<String, Object> attributes;
	
	//�Ϲݷα��ν� ���� ������
	public PrincipalDetails(UserVO user) {
		this.user = user;
	}

	//OAuth �α��ν� ���� ������
	public PrincipalDetails(UserVO user, Map<String, Object> attributes) {
		this.user = user;
		this.attributes = attributes;
	}
	
	
	//�ش� User�� ������ �����ϴ� ��
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		//����Ÿ���� Collection���� �ޱ� ������, ���� String���� �Ǿ��ִ� UserVO�� type ������ collctionŸ������ �����������(�ϱ�����)
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

	//���� ���Ῡ��
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	//���� ��� ����
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	//���� ��й�ȣ ��ȿ�Ⱓ �������� Ȯ���ϴ� ��
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	//���� Ȱ��ȭ ����
	@Override
	public boolean isEnabled() {
		
		//�츮 ����Ʈ���� 1�⵿�� ȸ���� �α����� ���ϸ� �޸� �������� �ϱ�� ���� ���,
		//DB�Ӽ��� loginDate(Timestamp��) ���� ���� �� �� ���� (�ϱ� ���� ����)
		//user.getLoginDate(); -> ���� �ð�-�α��νð� => 1�� �ʰ��� return false;
		
		return true;
	}


	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}


	@Override
	public String getName() {
		return null;
	}

	
}
