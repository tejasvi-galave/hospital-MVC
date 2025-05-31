package com.hospital.cotrl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
 public class DemoContrl {
	@GetMapping("/")
	 public String name() {
		System.out.println("11111");
		return "common/index";
	}
	
	@GetMapping("/log")
	 public String name1() {
		return "Doctors/addDoctor";
		 
	 }
 }
 