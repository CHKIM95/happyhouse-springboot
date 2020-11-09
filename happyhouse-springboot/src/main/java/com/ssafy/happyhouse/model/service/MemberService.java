package com.ssafy.happyhouse.model.service;

import com.ssafy.happyhouse.model.MemberDto;

public interface MemberService {

	void memberdelete(MemberDto member);
	void memberupdate(MemberDto member);
	MemberDto memberdetail(String string) throws Exception;
	void join(MemberDto memberDto) throws Exception;
	MemberDto login(String userid, String userpwd) throws Exception;
}
