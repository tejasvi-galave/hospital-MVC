package com.hospital.service.Impl;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.hospital.SignUpDto.SignUpReqDto;
import com.hospital.service.SignUpService;

@Service
public class SignUpServiceImpl implements SignUpService {

	@Override
	public boolean CreateAccount(SignUpReqDto signUpReqDto) {
		System.out.println(signUpReqDto.getRole());

		String url = "http://localhost:8080/signUp/createaccount";
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<SignUpReqDto> request = new HttpEntity<>(signUpReqDto, headers);

		Boolean userStatus = restTemplate.postForObject(url, request, Boolean.class);
		return userStatus;
	}

}
