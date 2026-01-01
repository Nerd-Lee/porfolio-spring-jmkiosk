package com.jm.kiosk.DTO;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuDTO {
	private Long id;
	private String name;
	private int price;
	private String category;
	private String image_url;
}