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
	public void memberdelete() {
	}

	@Override
	public void memberupdate() {
	}

	@Override
	public void memberdetail() throws Exception {
	}

	@Override
	public void join() throws Exception {
	}
	
	@Override
	public MemberDto login(String userid, String userpwd) throws Exception {
		return sqlSession.getMapper(MemberMapper.class).login(userid, userpwd);
	}
}
