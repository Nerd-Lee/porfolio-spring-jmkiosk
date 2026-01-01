package com.jm.kiosk.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.jm.kiosk.DTO.MenuDTO;
import com.jm.kiosk.DTO.OrderDTO;

@Service
public class KioskService {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 데이터베이스에 저장되어 있는 메뉴 전부 가져오기
	public List<MenuDTO> selectAllMenus(){
		String sql = "SELECT * FROM MENU";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(MenuDTO.class));
	}
	
	// 주문 후 주문 관련 정보 데이터베이스에 저장하기
	public void processOrder(List<OrderDTO> orders, int totalAmount) {
		String orderSql = "INSERT INTO ORDERS (TOTAL_PRICE) VALUES (?)";
		jdbcTemplate.update(orderSql, totalAmount);
		
		int lastOrderId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
		
		String itemSql = "INSERT INTO ORDER_ITEM (ORDER_ID, MENU_NAME, PRICE, QUANTITY) VALUES (?,?,?,?)";
		for(OrderDTO item : orders) {
			jdbcTemplate.update(itemSql, lastOrderId, item.getName(), item.getPrice(), item.getQuantity());
		}
	}
}
