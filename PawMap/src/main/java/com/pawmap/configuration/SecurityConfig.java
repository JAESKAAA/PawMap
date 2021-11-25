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
 * 소셜 로그인 시 대략적인 프로세스
 * 1. 코드받기 (인증) 
 * 2. 엑세스 토큰 획득 (권한)
 * 3. 사용자 프로필 정보 획등
 * 4-1. 프로필 정보를 토대로 회원가입 자동 진행
 * 4-2. (이메일,전화번호,이름,아이디) 쇼핑몰 -> (집주소), 백화점몰 -> (vip 등급, 일반등급) 등 요구되는 정보가 많으면 추가 정보를 form으로 받아 수동으로 회원가입 시켜야함
 * 
 */

@Configuration
@EnableWebSecurity //스프링 시큐리티 필터가 스프링 필터 체인에 등록됨 (시큐리티 기능 활성화를 위한 어노테이션)
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true) //secured 어노테이션 활성화하는 어노테이션
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	//oauth2 사용을 위한 의존성 주입
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
								//상기 3개의 주소 외에는 모든 권한 허용하는 코드
								.anyRequest().permitAll()
								//권한 없는 사람이 상기 페이지 접속시 "/login" 경로로 이동하도록 설정
								.and()
								.formLogin()
								.loginPage("/loginForm")
								.usernameParameter("userId")
								.passwordParameter("userPassword") //테스트 해보기 !! 
								//"/login" 주소가 호출되면 시큐리티가 낚아채서 대신 로그인을 진행해줌
								.loginProcessingUrl("/login")
								.defaultSuccessUrl("/")
								// oauth2 라이브러리를 통한 소셜 로그인을 위한 코드
								.and()
								.oauth2Login()
								.loginPage("/loginForm")
								// 구글 로그인 완료된 후 후처리 필요. Tip. 구글로그인 완료시 하기의 정보를 받음
								// 액세스 토큰 + 사용자 프로필정보
								.userInfoEndpoint()
								.userService(principalOauth2UserService);
						
	}
}