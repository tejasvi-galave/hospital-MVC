package com.hospital.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReceptionistReqDto {
	private String name;
	private String email;
	private String phone;
	private String dob;
}
