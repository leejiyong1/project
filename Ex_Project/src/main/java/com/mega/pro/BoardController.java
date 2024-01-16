package com.mega.pro;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDAO;
import util.MyCommon;
import vo.BoardVO;

@Controller
public class BoardController {
	
	BoardDAO dao;
	
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/board_list.do")
	public String boardList(Model model) {
		List<BoardVO> list = dao.board_list();
		model.addAttribute("list", list);
		return MyCommon.Board.VIEW_PATH+"board_list.jsp";
	}
	
	

}
