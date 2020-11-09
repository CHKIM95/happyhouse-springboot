package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.SidoGugunDongDto;

public interface MemberMapper {

	void memberdelete();
	void memberupdate();
	void memberdetail() throws Exception;
	void join(MemberDto memberDto) throws Exception;
	void logout() throws Exception;
	MemberDto login(String userid, String userpwd) throws Exception;
}
