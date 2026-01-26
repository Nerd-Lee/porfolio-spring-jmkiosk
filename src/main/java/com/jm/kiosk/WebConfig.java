package com.jm.kiosk;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration // 이 어노테이션이 있어야 스프링이 설정파일이라고 알아먹는다.
public class WebConfig implements WebMvcConfigurer {

	@Value("${file.upload-dir}")
	private String uploadDir;
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 1. 브라우저에서 /uploads/** 로 시작하는 주소로 요청이 오면
        // 2. 실제 MacOS 바탕화면의 kiosk_images 폴더로 연결해라!
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:" + uploadDir); 
    }
}