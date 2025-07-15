package com.hospital.service.Impl;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.hospital.Dto.LoginReqDto;
import com.hospital.Dto.LoginResDto;
import com.hospital.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Override
	public LoginResDto checkExistAccount(LoginReqDto loginReqDto) {
		String url = "http://localhost:8080/checkAccount";
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<LoginReqDto> request = new HttpEntity<>(loginReqDto, headers);

		try {
			LoginResDto dto = restTemplate.postForObject(url, request, LoginResDto.class);
			System.out.println("serviceImpl" + dto);
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
