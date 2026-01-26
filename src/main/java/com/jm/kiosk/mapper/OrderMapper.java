package com.jm.kiosk.mapper;

import java.util.List;

import com.jm.kiosk.DTO.OrderDTO;
import com.jm.kiosk.DTO.OrderItemDTO;

public interface OrderMapper {
	List<OrderDTO> selectAllOrders();
	List<OrderItemDTO> selectOrderItems(Long orderId);
	void deleteOrderItems(Long orderId);
	void deleteOrder(Long orderId);
}
