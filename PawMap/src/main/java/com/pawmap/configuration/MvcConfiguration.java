package com.pawmap.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer {
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		multipartResolver.setMaxUploadSizePerFile(100 * 1024 * 1024);
		return multipartResolver;
	}
	
//	//리팩토링할때 view컨트롤러 전부 여기에 매핑할 예정
//	@Override
//	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("요청URL주소").setViewName("jsp파일 이름");
//	}
}
