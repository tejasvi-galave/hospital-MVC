package com.hospital.cntrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hospital.Dto.DoctorRequestDto;
import com.hospital.Dto.DoctorResponseDto;
import com.hospital.service.DoctorService;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	@Autowired
	DoctorService doctorService;

	@PostMapping("/addDoctor")
	public String saveDoctor(@ModelAttribute DoctorRequestDto doctorRequestDto, HttpSession session) {
		DoctorRequestDto doctorReqtDto = new DoctorRequestDto();
		boolean isAdded = doctorService.saveDoctor(doctorRequestDto);

		if (isAdded) {
			System.out.println("data added successfully");
			return "redirect:/doctor/getDoctorLists";

		} else {
			System.out.println("failed");
			return "failed";
		}

	}

	@GetMapping("/getDoctorLists")
	public String getAllDoctor(Model model) {
		List<DoctorResponseDto> allList = doctorService.getAllDoctor();

		model.addAttribute("doctorList", allList);
		return "Doctors/AllDoctor";

	}

	@PostMapping("/editDoctor")
	public String updateDoctor(@ModelAttribute DoctorRequestDto doctorRequestDto) {
		System.out.println(doctorRequestDto.getFirstName());
		boolean isUpdate = doctorService.updateDoctor(doctorRequestDto);
		if (isUpdate) {
			return "redirect:/doctor/getDoctorLists";
		} else {
			return "errormsg";
		}
	}

}
