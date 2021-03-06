package com.ssafy.happyhouse.model.service;

import java.util.List;


import com.ssafy.happyhouse.model.ClinicDto;
import com.ssafy.happyhouse.model.HospitalDto;

public interface SurroundingService {

	List<ClinicDto> searchClinics(String gugun) throws Exception;	
	List<HospitalDto> searchHospitals(String gugun) throws Exception;
}
