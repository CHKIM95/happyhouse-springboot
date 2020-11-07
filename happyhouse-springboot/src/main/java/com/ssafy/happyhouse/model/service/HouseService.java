package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.SidoGugunDongDto;

public interface HouseService {

	List<SidoGugunDongDto> getSido() throws Exception;
	List<SidoGugunDongDto> getGugunInSido(String sido) throws Exception;
	List<SidoGugunDongDto> getDongInGugun(String gugun) throws Exception;
	
}
