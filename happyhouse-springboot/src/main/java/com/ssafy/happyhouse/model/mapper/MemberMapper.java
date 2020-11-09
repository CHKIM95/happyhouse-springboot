package com.ssafy.happyhouse.model.mapper;

import com.ssafy.happyhouse.model.MemberDto;

public interface MemberMapper {

	void memberdelete(MemberDto member);
	void memberupdate(MemberDto member);
	MemberDto memberdetail(String userid) throws Exception;
	void join(MemberDto memberDto) throws Exception;
	void logout() throws Exception;
	MemberDto login(String userid, String userpwd) throws Exception;
}
