package com.mega.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CommentDAO;
import util.MyCommon;

@Controller
public class CommentController {
	
	CommentDAO dao;
	
	public void setDao(CommentDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/comment_list.do")
	public String comment_list() {
		return MyCommon.Commnet.VIEW_PATH+"comment.jsp";
	}

}
