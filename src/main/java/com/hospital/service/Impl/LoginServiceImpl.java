package com.hospital.service.Impl;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.hospital.loginDto.LoginRequestDto;
import com.hospital.loginDto.LoginResponseDto;
import com.hospital.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Override
	public LoginResponseDto checkExistAccount(LoginRequestDto loginRequestDto) {
		System.out.println(loginRequestDto.getUserName());
		System.out.println(loginRequestDto.getPassword());

		String url = "http://localhost:8080/checkAccount";
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<LoginRequestDto> request = new HttpEntity<>(loginRequestDto, headers);

		LoginResponseDto responsedto = restTemplate.postForObject(url, request, LoginResponseDto.class);
		return responsedto;

	}
}
