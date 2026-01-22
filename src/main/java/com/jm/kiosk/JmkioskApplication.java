package com.jm.kiosk;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistration;

@SpringBootApplication
@MapperScan("com.jm.kiosk.mapper")
public class JmkioskApplication {

	public static void main(String[] args) {
		SpringApplication.run(JmkioskApplication.class, args);
	}
}
