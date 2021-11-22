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
@EnableWebSecurity //스프링 시큐리티 필터가 스프링 필터 체인에 등록됨 (시큐리티 기능 활성화를 위한 어노테이션)
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true) //secured 어노테이션 활성화하는 어노테이션
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	//해당 메서드의 리턴되는 오브젝트를 IoC로 등록해줌
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
								.defaultSuccessUrl("/"); 
						
	}
}
