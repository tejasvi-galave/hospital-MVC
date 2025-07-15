package com.hospital.cntrl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.hospital.Dto.LoginReqDto;
import com.hospital.Dto.LoginResDto;
import com.hospital.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;

	@PostMapping("/checkAccount")
	public String checkExistAccount(@ModelAttribute LoginReqDto loginReqDto, HttpSession session) {

		LoginResDto responseDto = loginService.checkExistAccount(loginReqDto);
		int id = responseDto.getId();
		System.out.println(id);
		String userName = responseDto.getUsername();
		String role = responseDto.getRole();
		if (responseDto != null) {
			session.setAttribute("id", id);
			session.setAttribute("role", role);
			session.setAttribute("user", userName);
			if ("admin".equalsIgnoreCase(responseDto.getRole())) {
				return "common/index";
				// admin dashboard
			} else if ("receptionist".equalsIgnoreCase(responseDto.getRole())) {
				return "common/index1";

			} else if ("doctor".equalsIgnoreCase(responseDto.getRole())) {
				return "common/index2";

			} else {
				return "Auth/login";
			}
		}

		return "Auth/login";

	}
}
