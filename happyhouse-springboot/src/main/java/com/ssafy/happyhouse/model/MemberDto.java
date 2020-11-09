package com.ssafy.happyhouse.model;
/*
 * DTO : Data Transfer Object
 * VO : 
 * Beans : 빈껍대기를 의미하는 말.
 */
public class MemberDto {

	/* 유저 아이디 */
	private String userid;
	/* 유저 이름 */
	private String username;
	/* 유저 페스워드 */
	private String userpwd;
	/* 유저 이메일 */
	private String email;
	/* 유저 주소 */
	private String address;
	/* 유저가 회원가입한 시간*/
	private String joindate;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

}
