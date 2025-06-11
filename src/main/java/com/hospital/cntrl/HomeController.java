package com.hospital.cntrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String name() {
		return "common/index";
	}

	@GetMapping("/doctorForm")
	public String showDoctorForm() {
		return "Doctors/add";

	}

	@GetMapping("/loginForm")
	public String showLoginForm() {
		return "Auth/login";

	}

	@GetMapping("/SignUpForm")
	public String showSignUpForm() {
		return "Auth/signUp";

	}

	@GetMapping("/updateForm")
	public String showUpdateForm() {
		return "Doctors/update";

	}
}
