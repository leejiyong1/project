package com.mega.pro;

import org.springframework.stereotype.Controller;

import dao.MemberDAO;

@Controller
public class MemberController {
	
	MemberDAO dao;
	
	public MemberController(MemberDAO dao) {
		this.dao =dao;
	}
	
	

}
