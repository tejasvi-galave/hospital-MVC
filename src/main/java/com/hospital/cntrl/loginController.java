package com.hospital.cntrl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.hospital.Dto.DoctorResponseDto;
import com.hospital.Dto.LoginReqDto;
import com.hospital.Dto.LoginResDto;
import com.hospital.service.DoctorService;
import com.hospital.service.LoginService;

@Controller
public class loginController {
	@Autowired
	LoginService loginService;
	@Autowired
	DoctorService doctorService;

	@PostMapping("/checkAccount")
	public String checkExistAccount(@ModelAttribute LoginReqDto loginReqDto, HttpSession session) {

		LoginResDto responseDto = loginService.checkExistAccount(loginReqDto);
		int id = responseDto.getId();
		String userName = responseDto.getUsername();
		String role = responseDto.getRole();
		if (responseDto != null) {
			session.setAttribute("id", id);
			session.setAttribute("role", role);
			session.setAttribute("user", userName);

			if ("doctor".equalsIgnoreCase(role)) {
				String email = responseDto.getUsername();
				System.out.println("email" + email);
				DoctorResponseDto doctor = doctorService.getDoctorByEmail(email);

				if (doctor != null) {

					session.setAttribute("doctorId", doctor.getId());
				}
			}
		}

		return "common/index";

	}
}
