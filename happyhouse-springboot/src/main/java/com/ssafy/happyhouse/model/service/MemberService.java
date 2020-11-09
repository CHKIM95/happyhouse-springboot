package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.SidoGugunDongDto;

public interface MemberService {

	void memberdelete();
	void memberupdate();
	void memberdetail() throws Exception;
	void join() throws Exception;
	MemberDto login(String userid, String userpwd) throws Exception;
}
