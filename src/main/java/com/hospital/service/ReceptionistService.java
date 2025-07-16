package com.hospital.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hospital.Dto.ReceptionistReqDto;
import com.hospital.Dto.ReceptionistResDto;

@Service
public interface ReceptionistService {

	boolean saveReceptionist(ReceptionistReqDto receptionistReqDto);

	List<ReceptionistResDto> findAllReceptionist();

	boolean update(ReceptionistReqDto receptionistReqDto);

	boolean delete(int id);

}
