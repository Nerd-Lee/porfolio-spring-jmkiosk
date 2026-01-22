package com.jm.kiosk.DTO;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrderDTO {
	private Long order_id;
	private int total_price;
	private Date order_date;
	private String name;
	private int price;
	private int quantity;
}
