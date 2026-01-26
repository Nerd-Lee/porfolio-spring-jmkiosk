package com.jm.kiosk.mapper;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jm.kiosk.DTO.AdminUserDTO;
import com.jm.kiosk.DTO.MenuDTO;
import com.jm.kiosk.DTO.OrderDTO;

@Mapper
public interface AdminMapper {
	int adminUserLogin(AdminUserDTO adminUserDto);
	void insertMenu(MenuDTO menuDTO);
	void updateMenu(MenuDTO menuDTO);
	MenuDTO getMenuById(Long id);
	void deleteMenu(Long id);
}
