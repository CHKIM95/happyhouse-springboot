package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.SidoGugunDongDto;

public interface MemberMapper {

	void memberdelete(MemberDto member);
	void memberupdate(String string);
	MemberDto memberdetail(String userid) throws Exception;
	void join(MemberDto memberDto) throws Exception;
	void logout() throws Exception;
	MemberDto login(String userid, String userpwd) throws Exception;
}
