package com.hospital.service;

import org.springframework.stereotype.Service;

import com.hospital.Dto.LoginReqDto;
import com.hospital.Dto.LoginResDto;

@Service
public interface LoginService {

	LoginResDto checkExistAccount(LoginReqDto loginRequestDto);

}
