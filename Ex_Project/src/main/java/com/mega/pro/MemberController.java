package com.mega.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDAO;
import util.MyCommon;

@Controller
public class MemberController {
	
	MemberDAO dao;
	
	public MemberController(MemberDAO dao) {
		this.dao =dao;
	}
	
	
	@RequestMapping(value = {"/","/join_form.do"})
	public String insert_form() {
		return MyCommon.Member.VIEW_PATH+"join_form.jsp";
	}
	

}
