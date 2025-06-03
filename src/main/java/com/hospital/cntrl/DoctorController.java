package com.hospital.cntrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.hospital.Dto.DoctorRequestDto;
import com.hospital.service.DoctorService;

@Controller
public class DoctorController {
	@Autowired
	DoctorService doctorService;

	@PostMapping("/addDoctor")
	public void saveDoctor(@ModelAttribute DoctorRequestDto doctorRequestDto) {
		boolean isAdded = doctorService.saveDoctor(doctorRequestDto);
		if (isAdded) {
			System.out.println("data added successfully");
		} else {
			System.out.println("failed");
		}
		System.out.println(doctorRequestDto.getFirstName() + " " + doctorRequestDto.getLastName() + " "
				+ doctorRequestDto.getPhone() + " " + doctorRequestDto.getEmail());

	}
}
