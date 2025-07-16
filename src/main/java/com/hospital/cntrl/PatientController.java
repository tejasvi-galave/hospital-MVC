package com.hospital.cntrl;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hospital.Dto.PageResponse;
import com.hospital.Dto.PatientsReqDto;
import com.hospital.Dto.PatientsResDto;
import com.hospital.service.PatientService;

@Controller
@RequestMapping("/patient")
public class PatientController {
	@Autowired
	PatientService patientService;

	@PostMapping("/add")
	public String savePatient(@ModelAttribute PatientsReqDto patientsReqDto, HttpSession session,
			RedirectAttributes redirectAttributes, Model model) {

		int userId = (int) session.getAttribute("id");
		System.out.println(userId);
		patientsReqDto.setUserId(userId);
		boolean isAdded = patientService.savePatient(patientsReqDto);
		if (isAdded) {
			redirectAttributes.addFlashAttribute("msg", "Patient added successfully");
			return "redirect:/patient/getActiveRecordByUserId";
		} else {
			model.addAttribute("error", "Patient not added");
			return "patients/add";
		}

	}

	@GetMapping("/getActiveRecordByUserId")
	public String findActivePatientsByUserId(@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "5") int size, Model model, HttpSession session) {

		int userId = (int) session.getAttribute("id");
		String role = (String) session.getAttribute("role");

		PageResponse<PatientsResDto> pageResponse = new PageResponse<>();

		if ("admin".equalsIgnoreCase(role)) {

			pageResponse = patientService.findAllPatients(page, size);
		} else if ("receptionist".equalsIgnoreCase(role)) {

			pageResponse = patientService.findByUserId(userId, page, size);

		}

		model.addAttribute("patientList", pageResponse.getContent());
		model.addAttribute("currentPage", pageResponse.getCurrentPage());
		model.addAttribute("totalPages", pageResponse.getTotalPages());
		model.addAttribute("pageSize", pageResponse.getPageSize());

		return "patients/all";
	}

	@GetMapping("/getInactiveRecord")
	public String findInactivePatientsByuserId(@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "5") int size, Model model, HttpSession session) {
		int userId = (int) session.getAttribute("id");
		String role = (String) session.getAttribute("role");

		PageResponse<PatientsResDto> pageResponse = new PageResponse<>();

		if ("admin".equalsIgnoreCase(role)) {

			pageResponse = patientService.findAllInActivePatient(page, size); // all inactive
		} else if ("receptionist".equalsIgnoreCase(role)) {
			List<PatientsResDto> list = patientService.findInactivePatientsByuserId(userId);
		}
		model.addAttribute("patientList", pageResponse.getContent());
		model.addAttribute("currentPage", pageResponse.getCurrentPage());
		model.addAttribute("totalPages", pageResponse.getTotalPages());
		model.addAttribute("pageSize", pageResponse.getPageSize());
		return "patients/all";
	}

	@GetMapping("/getPatient")
	public String getPatientById(@RequestParam int id, Model model) {
		PatientsResDto patient = patientService.getPatientById(id);
		model.addAttribute("patient", patient);
		return "patients/edit";
	}

	@PostMapping("/update")
	public String updatePatient(@ModelAttribute PatientsReqDto patientsReqDto, HttpSession session,
			RedirectAttributes redirectAttributes, Model model) {

		int userId = (int) session.getAttribute("id");
		patientsReqDto.setUserId(userId);
		boolean isAdded = patientService.updatePatient(patientsReqDto);
		if (isAdded) {
			redirectAttributes.addFlashAttribute("msg", "Updated Successfully");
			return "redirect:/patient/getActiveRecordByUserId";
		} else {
			model.addAttribute("error", "Patient not update");
			return "patients/edit";
		}
	}

	@ResponseBody
	@GetMapping("/searchbyName")
	public List<PatientsResDto> searchPatientByName(@RequestParam String name, @RequestParam String status,
			HttpSession session) {

		String role = (String) session.getAttribute("role");
		int userId = (int) session.getAttribute("id");

		if ("admin".equalsIgnoreCase(role)) {
			return patientService.searchPatientByNameAndStatus(name, status);
		} else if ("receptionist".equalsIgnoreCase(role)) {
			return patientService.searchPatientByNameAndUserId(name, status, userId);
		} else {
			return Collections.emptyList();
		}

	}
}
