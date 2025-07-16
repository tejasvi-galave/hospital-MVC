package com.hospital.cntrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hospital.Dto.ReceptionistReqDto;
import com.hospital.Dto.ReceptionistResDto;
import com.hospital.service.ReceptionistService;

@Controller
@RequestMapping("/receptionist")
public class ReceptionistController {
	@Autowired
	ReceptionistService receptionistService;

	@PostMapping("/add")
	public String saveReceptionist(@ModelAttribute ReceptionistReqDto receptionistReqDto) {
		boolean isAdded = receptionistService.saveReceptionist(receptionistReqDto);
		if (isAdded) {
			return "redirect:/receptionist/getAllRecord";

		} else {
			System.out.println("failed");
			return "receptionistForm";
		}

	}

	@GetMapping("/getAllRecord")
	public String findAllReceptionist(Model model) {
		List<ReceptionistResDto> receptList = receptionistService.findAllReceptionist();
		for (ReceptionistResDto recept : receptList) {
			System.out.println(recept.getName());
		}
		model.addAttribute("recept", receptList);
		return "Receptionist/all";
	}

	@PostMapping("/update")
	public String update(@ModelAttribute ReceptionistReqDto receptionistReqDto) {
		boolean isAdded = receptionistService.update(receptionistReqDto);
		return "redirect:/receptionist/getAllRecord";
	}

	@GetMapping("/deleteReceptionist")
	public String delete(@RequestParam int id) {
		System.out.println(id);
		boolean isAdded = receptionistService.delete(id);
		return "redirect:/receptionist/getAllRecord";

	}

}
