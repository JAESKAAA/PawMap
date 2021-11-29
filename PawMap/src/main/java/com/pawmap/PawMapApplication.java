package com.pawmap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
<<<<<<< HEAD

=======
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
>>>>>>> 1dfcfc36cb335e853906924a1fe36d8742657e78
@SpringBootApplication
public class PawMapApplication {

	public static void main(String[] args) {
		SpringApplication.run(PawMapApplication.class, args);
	}

<<<<<<< HEAD
=======
	//해당 메서드의 리턴되는 오브젝트를 IoC로 등록해줌
	//순환 참조 오류때문에 인코더를 밖으로 뺐음

		@Bean
		public BCryptPasswordEncoder encodePwd() {
			return new BCryptPasswordEncoder();
		}
		
	
>>>>>>> 1dfcfc36cb335e853906924a1fe36d8742657e78
}
