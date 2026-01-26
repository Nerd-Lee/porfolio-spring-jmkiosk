package com.jm.kiosk.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jm.kiosk.DTO.OrderDTO;
import com.jm.kiosk.DTO.OrderItemDTO;
import com.jm.kiosk.mapper.OrderMapper;

import jakarta.transaction.Transactional;

@Service
public class OrderService {
	@Autowired
	private OrderMapper orderMapper;
	
	public List<OrderDTO> selectAllOrders() {
		return orderMapper.selectAllOrders();
	}
	
	public List<OrderItemDTO> selectOrderItems(Long orderId){ 
		return orderMapper.selectOrderItems(orderId);
	}
	
	@Transactional
	public void deleteOrder(Long orderId) {
		orderMapper.deleteOrderItems(orderId);
		orderMapper.deleteOrder(orderId);
	}
}
