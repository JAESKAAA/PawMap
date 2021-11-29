package com.pawmap.configuration;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration //스프링 컨테이너에 해당 파일은 설정 파일임을 명시해줌
@PropertySource("classpath:/application.properties") //설정정보의 경로를 지정해줌
public class DataSourceConfiguration {

	@Autowired
	//스프링 컨터이너 의존성 주입
	private ApplicationContext applicationContext;
	
	@Bean
	@ConfigurationProperties(prefix="spring.datasource.hikari")
	//application.properties에서 접두사가 "spring.datasource.hikari"로 되어있는 값을
	//클래스로 가져와서 바인딩 시켜줌 (사용가능하게 해줌)
	public HikariConfig hikariConfig() {
		return new HikariConfig();
	}
	
	@Bean
	public DataSource dataSource() {
		DataSource dataSource = new HikariDataSource(hikariConfig());
		return dataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis-config.xml"));
		//classpath란?
		//Blog_Prac/src/main/java 또는 Blog_Prac/src/main/resources를 의미함
		//java build path에서 확인 가능
		// */ **/ 의 차이점
		// * (한개) 일때는 첫번째 하위 디렉토리에 있는 것만 인식 가능함
		//(ex. main/resources/config/mybatis-config.xml => 인식가능)
		//(ex. main/resources/config/config1/mybatis-config.xml => 인식불가능)
		//** (두개) 일때는, 모든 하위 디렉토리까지 스캔하여 전부 인식 가능함
		// 상기 예시 두가지 경우 전부 인식 가능함
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/**/*-mapping.xml"));
		return sqlSessionFactoryBean.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
