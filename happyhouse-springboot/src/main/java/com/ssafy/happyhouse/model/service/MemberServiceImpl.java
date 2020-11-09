package com.ssafy.happyhouse.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public MemberDto login(String userid, String userpwd) throws Exception {
		return sqlSession.getMapper(MemberMapper.class).login(userid, userpwd);
	}

	@Override
	public void join(MemberDto memberDto) throws Exception {
		sqlSession.getMapper(MemberMapper.class).join(memberDto);
	}

	@Override
	public void memberdelete(MemberDto member) {
		sqlSession.getMapper(MemberMapper.class).memberdelete(member);
		
	}

	@Override
	public void memberupdate(MemberDto member) {
		sqlSession.getMapper(MemberMapper.class).memberupdate(member.getUserid());
		
	}

	@Override
	public MemberDto memberdetail(String userid) throws Exception {
		return sqlSession.getMapper(MemberMapper.class).memberdetail(userid);
	}
}
