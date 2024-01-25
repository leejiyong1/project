package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	
	SqlSession sqlSession;
	
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	public List<BoardVO> board_list(HashMap<String, Integer> map){
		List<BoardVO> list = sqlSession.selectList("b.board_list",map);
		return list;
	}
	public int page() {
		int total = sqlSession.selectOne("b.count_page");
		return total;
	}
	
	public int board_write(BoardVO vo) {
		int res = sqlSession.insert("b.board_write", vo);
		return res;
	}
	
	public int board_delete(int idx,String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("id", id);
		int res = sqlSession.delete("b.board_delete",map);
		return res;
	}
	
	public BoardVO board_select_view(int idx) {
		BoardVO vo = sqlSession.selectOne("b.board_view", idx);
		return vo;
	}
	
	public int board_hit(int idx) {
		int res = sqlSession.update("b.board_hit",idx);
		return res;
	}
	
	public List<BoardVO> board_search(HashMap<String, Object> map) {
		List<BoardVO> list = sqlSession.selectOne("b.board_search", map);
		return list;
	}
	
	public int getSearchTotal(String keyword) {
		int cnt = sqlSession.selectOne("b.count_page_search", keyword);
		return cnt;
	}

}
