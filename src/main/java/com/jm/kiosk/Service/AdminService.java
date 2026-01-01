package com.jm.kiosk.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.jm.kiosk.DTO.MenuDTO;

@Service
public class AdminService {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 메뉴 추가 로직
	public void insertMenu(MenuDTO menuDTO) {
		String sql = "INSERT INTO MENU (NAME, PRICE, CATEGORY, IMAGE_URL) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sql,menuDTO.getName(),menuDTO.getPrice(),menuDTO.getCategory(),menuDTO.getImage_url());
	}
	
	// 메뉴 수정 로직
	public void updateMenu(MenuDTO menuDTO) {
		String sql = "UPDATE MENU SET NAME = ?, PRICE = ?, CATEGORY = ? WHERE ID = ?";
		jdbcTemplate.update(sql, menuDTO.getName(), menuDTO.getPrice(), menuDTO.getCategory(), menuDTO.getId());
	}
	
	// 메뉴 개별 수정을 위한 단건 조회
	public MenuDTO getMenuById(Long id) {
		String sql = "SELECT * FROM MENU WHERE ID = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(MenuDTO.class), id);
	}
	
	// 메뉴 삭제
	public void deleteMenu(Long id) {
		String sql = "DELETE FROM MENU WHERE ID = ?";
		jdbcTemplate.update(sql, id);
	}
}
