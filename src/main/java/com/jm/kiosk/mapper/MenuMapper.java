package com.jm.kiosk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jm.kiosk.DTO.MenuDTO;
import com.jm.kiosk.DTO.OrderDTO;

@Mapper
public interface MenuMapper {
	List<MenuDTO> selectAllMenus();
	int insertOrder(OrderDTO orderDto);
	void insertOrderItem(@Param("orderId")Long orderId, @Param("list") List <OrderDTO> orders);
}
