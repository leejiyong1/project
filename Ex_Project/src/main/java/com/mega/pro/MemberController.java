package com.mega.pro;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import dao.MemberDAO;
import util.MyCommon;
import vo.MemberVO;

@Controller
public class MemberController {

	MemberDAO dao;

	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;

	public MemberController(MemberDAO dao) {
		this.dao = dao;
	}

	@RequestMapping(value = { "/", "/join_form.do" })
	public String insert_form() {
		return MyCommon.Member.VIEW_PATH + "join_form.jsp";
	}

	@RequestMapping("id_check.do")
	@ResponseBody
	public String check_id(String id) {
		MemberVO vo = dao.check(id);
		if (vo == null) {
			return "yes";
		} else {
			return "no";
		}
	}

	@RequestMapping("join.do")
	public String join(MemberVO vo) {
		dao.join(vo);
		return "redirect:login_form.do";
	}

	@RequestMapping("login_form.do")
	public String login_form() {
		return MyCommon.Member.VIEW_PATH + "login.jsp";
	}

	@RequestMapping("main.do")
	public String Main() {
		return MyCommon.Member.VIEW_PATH + "main.jsp";
	}

	@RequestMapping("login.do")
	@ResponseBody
	public String login(String id, String pwd) {
		MemberVO vo = dao.login(id);
		if (vo == null) {
			return "no_id";
		}

		if (!vo.getPwd().equals(pwd)) {
			return "no_pwd";
		} else {
			session = request.getSession();
			session.setAttribute("mem", vo);
			return "yes";
		}
	}

	@RequestMapping("logout.do")
	public String logout() {
		session = request.getSession();
		session.removeAttribute("mem");
		return "redirect:login_form.do";
	}

	

}
