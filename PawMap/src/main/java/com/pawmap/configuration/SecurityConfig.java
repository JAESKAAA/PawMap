package com.pawmap.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.pawmap.configuration.oauth.PrincipalOauth2UserService;

/*
 * �Ҽ� �α��� �� �뷫���� ���μ���
 * 1. �ڵ�ޱ� (����) 
 * 2. ������ ��ū ȹ�� (����)
 * 3. ����� ������ ���� ȹ��
 * 4-1. ������ ������ ���� ȸ������ �ڵ� ����
 * 4-2. (�̸���,��ȭ��ȣ,�̸�,���̵�) ���θ� -> (���ּ�), ��ȭ���� -> (vip ���, �Ϲݵ��) �� �䱸�Ǵ� ������ ������ �߰� ������ form���� �޾� �������� ȸ������ ���Ѿ���
 * 
 */

@Configuration
@EnableWebSecurity //������ ��ť��Ƽ ���Ͱ� ������ ���� ü�ο� ��ϵ� (��ť��Ƽ ��� Ȱ��ȭ�� ���� ������̼�)
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true) //secured ������̼� Ȱ��ȭ�ϴ� ������̼�
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	//oauth2 ����� ���� ������ ����
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	
//	@Override
//	public void configure(WebSecurity web) throws Exception {
//		web.ignoring().antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/img/**", "/icon/**");
//	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	
		
		http.csrf().disable();
		http.authorizeRequests()
								.antMatchers("/user/**").authenticated()
								.antMatchers("/manager/**").access("hasRole('ROLE_ADMIN')")
								.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
								//��� 3���� �ּ� �ܿ��� ��� ���� ����ϴ� �ڵ�
								.anyRequest().permitAll()
								//���� ���� ����� ��� ������ ���ӽ� "/login" ��η� �̵��ϵ��� ����
								.and()
								.formLogin()
								.loginPage("/loginForm")
								.usernameParameter("userId")
								.passwordParameter("userPassword") //�׽�Ʈ �غ��� !! 
								//"/login" �ּҰ� ȣ��Ǹ� ��ť��Ƽ�� ����ä�� ��� �α����� ��������
								.loginProcessingUrl("/login")
								.defaultSuccessUrl("/")
								// oauth2 ���̺귯���� ���� �Ҽ� �α����� ���� �ڵ�
								.and()
								.oauth2Login()
								.loginPage("/loginForm")
								// ���� �α��� �Ϸ�� �� ��ó�� �ʿ�. Tip. ���۷α��� �Ϸ�� �ϱ��� ������ ����
								// �׼��� ��ū + ����� ����������
								.userInfoEndpoint()
								.userService(principalOauth2UserService);
						
	}
}
