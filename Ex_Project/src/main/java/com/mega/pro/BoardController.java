package com.mega.pro;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDAO;
import util.Common;
import util.MyCommon;
import util.Paging;
import util.SearchPaging;
import vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext app;
	
	@Autowired
	HttpSession session;
	
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
		List<BoardVO> list =dao.board_list(map);
		int rowTotal = dao.page();
		request.getSession().removeAttribute("hit");
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
	
	@RequestMapping("/board_write.do")
	public String board_write(BoardVO vo) {
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		String web_path = "/resources/upload/";
		String path = app.getRealPath(web_path);
		System.out.println("절대경로:" + path);
		MultipartFile photo = vo.getPhoto();
		
		String filename = "no_file";
		
		if(!photo.isEmpty()) {
			filename = photo.getOriginalFilename();
			File f = new File(path, filename);
			if(!f.exists()) {
				f.mkdirs();
			}else {
				long time = System.currentTimeMillis();
				filename = String.format("%s_%d", filename,time);
				f = new File(path, filename);
			}
			
			try {
				photo.transferTo(f);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		vo.setFilename(filename);
		dao.board_write(vo);
		return "redirect:board_list.do";
	}
	
	@RequestMapping("/board_del.do")
	@ResponseBody
	public String board_del(String id,int idx) {
		int res = dao.board_delete(idx, id);
		if(res>0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping("/board_view.do")
	public String board_view(int idx,int page,Model model) {
		BoardVO vo = dao.board_select_view(idx);
		
		String hit = (String)session.getAttribute("hit");
		if(hit == null) {
			dao.board_hit(idx);
			session.setAttribute("hit", "+1");
		}
		model.addAttribute("vo", vo);
		return MyCommon.Board.VIEW_PATH+"board_view.jsp";
	}
	
	@RequestMapping("/board_search.do")
	public String board_view(Model model, String page, String keyword) {
		int nowpage = 1;
		if(page != null && !page.isEmpty()) {
			nowpage = Integer.parseInt(page);
		}
		int start = (nowpage-1) * Common.Board.BLOCKLIST + 1;
		int end = start+Common.Board.BLOCKLIST-1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		List<BoardVO> list = dao.board_search(map);
		request.getSession().removeAttribute("hit");
		int rowTotal = dao.getSearchTotal(keyword);
		String pageMenu = SearchPaging.getPaging("board_search.do", nowpage, rowTotal, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE,keyword);
		model.addAttribute("list", list);
		model.addAttribute("menu",pageMenu);
		return MyCommon.Board.VIEW_PATH+"board_list.jsp";
	}	
}
