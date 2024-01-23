package com.mega.pro;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
import vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext app;
	
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
	
	
}
