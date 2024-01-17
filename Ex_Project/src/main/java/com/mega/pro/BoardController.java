package com.mega.pro;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDAO;
import util.Common;
import util.MyCommon;
import util.Paging;
import vo.BoardVO;

@Controller
public class BoardController {
	
	BoardDAO dao;
	
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/board_list.do")
	public String boardList(Model model,String page) {
		int nowpage = 1;
		if(page != null && !page.isEmpty()) {
			nowpage = Integer.parseInt(page);
		}
		int start = (nowpage-1) * Common.Board.BLOCKLIST + 1;
		int end = start+Common.Board.BLOCKLIST-1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<BoardVO> list = dao.board_list(map);
		int rowTotal = dao.page();
		String pageMenu = Paging.getPaging("board_list.do", nowpage, rowTotal, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);
		model.addAttribute("list", list);
		model.addAttribute("menu",pageMenu);
		return MyCommon.Board.VIEW_PATH+"board_list.jsp";
	}
	@RequestMapping("/index.do")
	public String main() {
		return "/WEB-INF/views/main/index.jsp";
	}
	
	@RequestMapping("/board_write_form.do")
	public String board_write_form() {
		return MyCommon.Board.VIEW_PATH+"board_write.jsp";
	}
	
}
