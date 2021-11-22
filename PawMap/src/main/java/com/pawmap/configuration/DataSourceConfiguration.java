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

@Configuration //������ �����̳ʿ� �ش� ������ ���� �������� �������
@PropertySource("classpath:/application.properties") //���������� ��θ� ��������
public class DataSourceConfiguration {

	@Autowired
	//������ �����̳� ������ ����
	private ApplicationContext applicationContext;
	
	@Bean
	@ConfigurationProperties(prefix="spring.datasource.hikari")
	//application.properties���� ���λ簡 "spring.datasource.hikari"�� �Ǿ��ִ� ����
	//Ŭ������ �����ͼ� ���ε� ������ (��밡���ϰ� ����)
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
		//classpath��?
		//Blog_Prac/src/main/java �Ǵ� Blog_Prac/src/main/resources�� �ǹ���
		//java build path���� Ȯ�� ����
		// */ **/ �� ������
		// * (�Ѱ�) �϶��� ù��° ���� ���丮�� �ִ� �͸� �ν� ������
		//(ex. main/resources/config/mybatis-config.xml => �νİ���)
		//(ex. main/resources/config/config1/mybatis-config.xml => �νĺҰ���)
		//** (�ΰ�) �϶���, ��� ���� ���丮���� ��ĵ�Ͽ� ���� �ν� ������
		// ��� ���� �ΰ��� ��� ���� �ν� ������
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/**/*-mapping.xml"));
		return sqlSessionFactoryBean.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
