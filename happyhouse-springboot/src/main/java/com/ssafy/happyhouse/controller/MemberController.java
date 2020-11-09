package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {
	@Autowired
	private MemberService memberService;
	/**
	 * 로그인창으로 이동
	 * @return
	 */
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request, Model model) {
		Cookie cookies[] = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if("userid".equals(cookie.getName())) {
					model.addAttribute("ssafy_id", cookie.getValue());
					break;
				}
			}
		}
		return "user/login";
	}
	 /**
	  * 로그인
	  * @param request
	  * @param response
	  * @param session
	  * @param member
	  * @param model
	  * @return
	  */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, HttpServletRequest request, HttpServletResponse response,HttpSession session, MemberDto member, Model model) {
		String path = "index";
		String userid = member.getUserid();
		String userpwd = member.getUserpwd();
		
		try {
			MemberDto memberDto = memberService.login(userid, userpwd);
			if(memberDto != null) {
//				session 설정
				session.setAttribute("user", memberDto);
				
//				cookie 설정
				Cookie cookie = new Cookie("ssafy_id", userid);
				cookie.setPath("/");
				if("saveok".equals(map.get("idsave"))) {//아이디 저장을 체크 했다면.
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);//40년간 저장.
				} else {//아이디 저장을 해제 했다면.
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
			} else {
				request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
				path = "error/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			path = "error/error";
		}
		return path;
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
}
