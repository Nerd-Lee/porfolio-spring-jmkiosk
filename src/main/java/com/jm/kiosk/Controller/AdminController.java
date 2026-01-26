package com.jm.kiosk.Controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jm.kiosk.DTO.AdminUserDTO;
import com.jm.kiosk.DTO.MenuDTO;
import com.jm.kiosk.Service.AdminService;
import com.jm.kiosk.Service.KioskService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private KioskService kioskService;
	
	@Value("${file.upload-dir}")
    private String uploadPath;
	
	// 운영자 로그인 페이지
	@GetMapping("/login")
	public String loginPage(HttpSession session) {
		// 로그인이 완료된 관리자 세션 정보가 있는 지 확인
		Object admin = session.getAttribute("adminUser");
		
		// 만약 관리자 로그인이 된 상태라면, 재로그인 필요없으니 리다이렉트
		if(admin != null) {
			return "redirect:/admin/menu";
		}
		
		return "admin/admin_login";
	}

	// 운영자 로그인 확인, 아이디와 패스워드를 확인 후 맞으면 session을 저장해서 로그인 유지, 틀릴 경우 에러메시지를 뱉는다.
	@PostMapping("/login")
	public String loginProcess(@RequestParam("id") String id, @RequestParam("password") String password, HttpSession session, Model model) {
		AdminUserDTO adminUserDto = new AdminUserDTO(id, password);
		Integer count = adminService.adminUserLogin(adminUserDto);
		
		if(count != null && count > 0) {
			session.setAttribute("adminUser", id);
			return "redirect:/admin/menu";
		}
		else {
			model.addAttribute("error", "아이디 또는 비밀번호가 틀렸습니다.");
			return "admin/admin_login";
		}
	}
	
	// 운영자 로그아웃 페이지
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/menu")
	public String adminMenu() {
		return "admin/admin_menu";
	}
	
	// 메뉴 추가 페이지
	@GetMapping("/menu/new")
	public String menuAddForm() {
		return "admin/admin_add_menu";
	}
	
	// 메뉴 저장 후, 운영자 메뉴로 이동
	@PostMapping("/menu/add")
	public String addMenu(@RequestParam("image") MultipartFile file, @ModelAttribute MenuDTO menuDTO, HttpServletRequest request) throws IOException {
		if(!file.isEmpty()) {
			// 파일 저장 경로 설정
			
			String fileName = System.currentTimeMillis() +"_" +file.getOriginalFilename();
			File saveFile = new File(uploadPath + fileName);
			
			// 만약 폴더가 혹시 없으면 생성
	        if (!new File(uploadPath).exists()) {
	            new File(uploadPath).mkdirs();
	        }
			
			file.transferTo(saveFile);
			
			menuDTO.setImage_url("/uploads/" + fileName);
		}
		
		adminService.insertMenu(menuDTO);
		return "redirect:/admin/menu";
	}
	
	// 메뉴 수정 및 삭제 페이지 이동 ( 메뉴 전체 보여줌 )
	@GetMapping("/menu/update_page")
	public String menuUpdatePage(Model model) {
		model.addAttribute("menuList",kioskService.selectAllMenus());
		return "admin/admin_menu_update";
	}
	
	// 메뉴 개별 수정
	@GetMapping("/menu/edit/{id}")
	public String editMenuForm(@PathVariable("id") Long Id, Model model) {
		MenuDTO menu = adminService.getMenuById(Id);
		model.addAttribute("menu", menu);
		return "admin/admin_menu_edit";
	}
	
	// 삭제 요청
	@GetMapping("/menu/delete/{id}")
	public String deleteMenu(@PathVariable("id") Long id) {
		adminService.deleteMenu(id);
		return "redirect:/admin/menu/update_page";
	}
	
	// 수정 POST
	@PostMapping("/menu/update")
	public String menuUpdate(@ModelAttribute MenuDTO menuDTO) {
		adminService.updateMenu(menuDTO);
		return "redirect:/admin/menu/update_page";
	}
}