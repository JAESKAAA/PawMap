package com.pawmap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class PawMapApplication {

	public static void main(String[] args) {
		SpringApplication.run(PawMapApplication.class, args);
	}

	//해당 메서드의 리턴되는 오브젝트를 IoC로 등록해줌
	//순환 참조 오류때문에 인코더를 밖으로 뺐음

		@Bean
		public BCryptPasswordEncoder encodePwd() {
			return new BCryptPasswordEncoder();
		}
		
	
}
