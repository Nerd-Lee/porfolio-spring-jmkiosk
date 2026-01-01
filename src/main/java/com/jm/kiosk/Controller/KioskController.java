package com.jm.kiosk.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jm.kiosk.DTO.MenuDTO;
import com.jm.kiosk.DTO.OrderDTO;
import com.jm.kiosk.Service.KioskService;

//http://localhost:8080/h2-console/
@Controller
public class KioskController {
	@Autowired
	private KioskService kioskService;
	
	// 메인 페이지
	@GetMapping("/")
	public String mainHome() {
		kioskService.selectAllMenus();
		return "kiosk_home";
	}
	
	// 키오스크 메뉴 페이지
	@GetMapping("/kiosk")
	public String menuList(Model model)
	{
		model.addAttribute("menuList",kioskService.selectAllMenus());
		return "kiosk_main";
	}
	
	@PostMapping("/kiosk/pay")
	@ResponseBody
	// 주문 로직
	public String pay(@RequestBody List<OrderDTO> orderList) {
		int total = 0;
		for(OrderDTO item : orderList) {
			total += item.getPrice();
		}
		
		kioskService.processOrder(orderList, total);
		
		return "success";
	}
}