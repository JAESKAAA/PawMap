package com.pawmap.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity //������ ��ť��Ƽ ���Ͱ� ������ ���� ü�ο� ��ϵ� (��ť��Ƽ ��� Ȱ��ȭ�� ���� ������̼�)
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true) //secured ������̼� Ȱ��ȭ�ϴ� ������̼�
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	//�ش� �޼����� ���ϵǴ� ������Ʈ�� IoC�� �������
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	
		http.csrf().disable();
		http.authorizeRequests().antMatchers("/user/**").authenticated()
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
								.defaultSuccessUrl("/"); 
						
	}
}
