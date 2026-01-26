package com.jm.kiosk.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrderItemDTO {
	private String menu_name;
	private Integer price;
	private Integer quantity;
	private String image_url;
}