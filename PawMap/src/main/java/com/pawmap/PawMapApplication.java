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

	//�ش� �޼����� ���ϵǴ� ������Ʈ�� IoC�� �������
	//��ȯ ���� ���������� ���ڴ��� ������ ����
		@Bean
		public BCryptPasswordEncoder encodePwd() {
			return new BCryptPasswordEncoder();
		}
}
