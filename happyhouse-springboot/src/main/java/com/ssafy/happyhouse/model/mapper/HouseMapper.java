package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.SidoGugunDongDto;

public interface HouseMapper {

	List<SidoGugunDongDto> getSido() throws Exception;
	List<SidoGugunDongDto> getGugunInSido(String sido) throws Exception;
	List<SidoGugunDongDto> getDongInGugun(String gugun) throws Exception;
}
