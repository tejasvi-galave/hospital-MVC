package com.hospital.cntrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.hospital.loginDto.LoginRequestDto;
import com.hospital.loginDto.LoginResponseDto;
import com.hospital.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;

	@PostMapping("/checkAccount")
	public String checkExistAccount(@ModelAttribute LoginRequestDto loginRequestDto) {
		System.out.println(loginRequestDto.getUserName() + "");
		LoginResponseDto responseDto = loginService.checkExistAccount(loginRequestDto);
		if ("admin".equalsIgnoreCase(responseDto.getRole())) {
			return "common/index"; // admin dashboard
		} else if ("doctor".equalsIgnoreCase(responseDto.getRole())) {
			return "doctor/dashboard"; // your doctor JSP

		} else if ("receptionist".equalsIgnoreCase(responseDto.getRole())) {
			return "reception/dashboard"; // your receptionist JSP

		} else {
			return "common/unauthorized"; // fallback
		}

	}
}
