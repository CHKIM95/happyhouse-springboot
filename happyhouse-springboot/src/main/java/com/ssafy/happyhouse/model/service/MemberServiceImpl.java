package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.SidoGugunDongDto;
import com.ssafy.happyhouse.model.mapper.HouseMapper;

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
	public void logout() throws Exception {
	}

	@Override
	public void login() throws Exception {
	}
}
