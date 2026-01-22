package com.jm.kiosk.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.jm.kiosk.DTO.AdminUserDTO;
import com.jm.kiosk.DTO.MenuDTO;
import com.jm.kiosk.DTO.OrderDTO;
import com.jm.kiosk.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired
	private AdminMapper adminMapper;
	
	public int adminUserLogin(AdminUserDTO adminUserDto) {
		return adminMapper.adminUserLogin(adminUserDto);
	}
	
	// 메뉴 추가 로직
	public void insertMenu(MenuDTO menuDTO) {
		adminMapper.insertMenu(menuDTO);
	}
	
	// 메뉴 수정 로직
	public void updateMenu(MenuDTO menuDTO) {
		adminMapper.updateMenu(menuDTO);
	}
	
	// 메뉴 개별 수정을 위한 단건 조회
	public MenuDTO getMenuById(Long id) {
		return adminMapper.getMenuById(id);
	}
	
	// 메뉴 삭제
	public void deleteMenu(Long id) {
		adminMapper.deleteMenu(id);
	}
	
	public List<OrderDTO> selectAllOrders() {
		return adminMapper.selectAllOrders();
	}
}
