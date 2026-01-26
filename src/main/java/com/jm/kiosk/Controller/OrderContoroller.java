package com.jm.kiosk.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jm.kiosk.DTO.MenuDTO;
import com.jm.kiosk.Service.AdminService;
import com.jm.kiosk.Service.OrderService;

@Controller
@RequestMapping("/orders")
public class OrderContoroller {	
	@Autowired
	private OrderService orderService;
	
	// 주문 내역 확인 페이지
	@GetMapping("/confirm")
	public String orderMenu(Model model) {
		model.addAttribute("orders", orderService.selectAllOrders());
		return "order/order_menu_confirm";
	}
	
	@GetMapping("/confirm/{id}")
	public String editMenuForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("items", orderService.selectOrderItems(id));
		return "order/order_detail_view";
	}
	
	// 삭제 요청
	@GetMapping("/delete/{id}")
	public String deleteMenu(@PathVariable("id") Long id) {
		orderService.deleteOrder(id);
		return "redirect:/orders/confirm";
	}
}