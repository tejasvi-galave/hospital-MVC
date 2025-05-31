package com.hospital;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@ComponentScan(basePackages="com.hospital")
public class HospitalMVCStarterClass {

	public static void main(String[] args) {
		SpringApplication.run(HospitalMVCStarterClass.class, args);
	}

}
