package com.hospital.service.Impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.hospital.Dto.DoctorRequestDto;
import com.hospital.Dto.DoctorResponseDto;
import com.hospital.service.DoctorService;

@Service
public class DoctorServiceImpl implements DoctorService {

	@Override
	public boolean saveDoctor(DoctorRequestDto doctorRequestDto) {

		String url = "http://localhost:8080/doctor/add";
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<DoctorRequestDto> request = new HttpEntity<>(doctorRequestDto, headers);

		try {
			boolean response = restTemplate.postForObject(url, request, String.class) != null;
			System.out.println(response);
			return response;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public List<DoctorResponseDto> getAllDoctor() {

		String url = "http://localhost:8080/doctor/getallRecord";
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<String> request = new HttpEntity<>(headers);

		try {
			DoctorResponseDto[] doctorList = restTemplate.getForObject(url, DoctorResponseDto[].class);

			return Arrays.asList(doctorList);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;

	}

	public boolean updateDoctor(DoctorRequestDto doctorRequestDto) {

		String url = "http://localhost:8080/doctor/update";
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<DoctorRequestDto> request = new HttpEntity<>(doctorRequestDto, headers);

		try {
			boolean response = restTemplate.postForObject(url, request, String.class) != null;
			System.out.println(response);
			return response;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

}
