package com.jm.kiosk.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.jm.kiosk.DTO.MenuDTO;
import com.jm.kiosk.DTO.OrderDTO;
import com.jm.kiosk.mapper.MenuMapper;

import jakarta.transaction.Transactional;

@Service
public class KioskService {
	@Autowired
	private MenuMapper menuMapper;
	
	// 데이터베이스에 저장되어 있는 메뉴 전부 가져오기
	public List<MenuDTO> selectAllMenus(){
		return menuMapper.selectAllMenus();
	}
	
	// 주문 후 주문 관련 정보 데이터베이스에 저장하기
	@Transactional
	public void processOrder(List<OrderDTO> orders, OrderDTO orderDto) {
		menuMapper.insertOrder(orderDto);
		
		Long lastId = orderDto.getOrder_id();
		menuMapper.insertOrderItem(lastId, orders);
	}
}
