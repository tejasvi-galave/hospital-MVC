package com.hospital.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hospital.Dto.PageResponse;
import com.hospital.Dto.PatientsReqDto;
import com.hospital.Dto.PatientsResDto;

@Service
public interface PatientService {

	boolean savePatient(PatientsReqDto patientsReqDto);

	PatientsResDto getPatientById(int id);

	boolean updatePatient(PatientsReqDto patientsReqDto);

	List<PatientsResDto> findInactivePatientsByuserId(int userId);

	List<PatientsResDto> searchPatientByNameAndUserId(String name, String status, int userId);

	PageResponse<PatientsResDto> findByUserId(int userId, int page, int size);

	PageResponse<PatientsResDto> findAllPatients(int page, int size);

	List<PatientsResDto> searchPatientByNameAndStatus(String name, String status);

	PageResponse<PatientsResDto> findAllInActivePatient(int page, int size);

}
