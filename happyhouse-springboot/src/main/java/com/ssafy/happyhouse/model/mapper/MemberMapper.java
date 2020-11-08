package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.SidoGugunDongDto;

public interface MemberMapper {

	void memberdelete();
	void memberupdate();
	void memberdetail() throws Exception;
	void join() throws Exception;
	void logout() throws Exception;
	void login() throws Exception;
}
