package com.jm.kiosk.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class AdminUserDTO {
	private String id;
	private String password;
	
	public AdminUserDTO(String id, String password)
	{
		this.id = id;
		this.password = password;
	}
}
