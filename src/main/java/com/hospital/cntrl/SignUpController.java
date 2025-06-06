package com.hospital.cntrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.hospital.SignUpDto.SignUpReqDto;
import com.hospital.service.SignUpService;

@Controller
public class SignUpController {
	@Autowired
	SignUpService signUpService;

	@PostMapping("/SignUpAccount")
	public String CreateAccount(@ModelAttribute SignUpReqDto signUpReqDto, Model model) {
		System.out.println(signUpReqDto.getName() + " " + signUpReqDto.getEmail() + " " + signUpReqDto.getPassword()
				+ " " + signUpReqDto.getPhone() + " " + signUpReqDto.getRole());
		boolean userStatus = signUpService.CreateAccount(signUpReqDto);
		if (userStatus) {
			model.addAttribute("alertType", "success");
			model.addAttribute("alertMessage", "Account created successfully!");
			return "common/index";
		}
		model.addAttribute("alertType", "error");
		model.addAttribute("alertMessage", "User all ready exist...!");

		return "Auth/login";
	}
}
