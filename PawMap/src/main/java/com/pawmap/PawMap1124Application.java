package com.pawmap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@SpringBootApplication
public class PawMap1124Application {

	public static void main(String[] args) {
		SpringApplication.run(PawMap1124Application.class, args);
	}

	//�ش� �޼����� ���ϵǴ� ������Ʈ�� IoC�� �������
	//��ȯ ���� ���������� ���ڴ��� ������ ����
		@Bean
		public BCryptPasswordEncoder encodePwd() {
			return new BCryptPasswordEncoder();
		}

	
}
