package com.mega.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import util.MyCommon;
import vo.MemberVO;

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
	
	@RequestMapping("id_check.do")
	@ResponseBody
	public String check_id(String id) {
		MemberVO vo = dao.check(id);
		if(vo == null) {
			return "yes";
		}else {
			return "no";
		}
	}
	
	@RequestMapping("join.do")
	public String join(MemberVO vo) {
		dao.join(vo);
		return "redirect:join_form.do";
	}
	

}
