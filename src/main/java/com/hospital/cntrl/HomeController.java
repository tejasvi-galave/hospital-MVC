package com.hospital.cntrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String name() {
		return "Auth/login";
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

	@GetMapping("/DoctorUpdateForm")
	public String showUpdateForm() {
		return "Doctors/update";
	}

	@GetMapping("/patientForm")
	public String showPatientForm() {
		return "patients/add";
	}

	@GetMapping("/receptionistForm")
	public String showReceptionistForm() {
		return "Receptionist/add";
	}

	@GetMapping("/ReceptionistUpdateForm")
	public String showReceptUpdateForm() {
		return "Receptionist/update";
	}
}
