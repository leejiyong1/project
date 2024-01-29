package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {

	SqlSession sqlSession;

	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//게시판
	public List<BoardVO> board_list(HashMap<String, Integer> map) {
		List<BoardVO> list = sqlSession.selectList("b.board_list", map);
		return list;
	}
	
	//페이징
	public int page() {
		int total = sqlSession.selectOne("b.count_page");
		return total;
	}
	
	//글추가
	public int board_write(BoardVO vo) {
		int res = sqlSession.insert("b.board_write", vo);
		return res;
	}
	
	//글삭제
	public int board_delete(int idx, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("id", id);
		int res = sqlSession.delete("b.board_delete", map);
		return res;
	}
	
	//글보기
	public BoardVO board_select_view(int idx) {
		BoardVO vo = sqlSession.selectOne("b.board_view", idx);
		return vo;
	}
	
	//조회수
	public int board_hit(int idx) {
		int res = sqlSession.update("b.board_hit", idx);
		return res;
	}
	
	//검색
	public List<BoardVO> board_search(Map<String, Object> map) {
		List<BoardVO> list = sqlSession.selectList("b.board_search", map);
		return list;
	}
	
	//제목검색갯수
	public int getSearchTotal(String keyword) {
		int cnt = sqlSession.selectOne("b.count_page_search", keyword);
		return cnt;
	}
	
	//제목+내용검색
	public List<BoardVO> board_search_tc(Map<String, Object> map){
		List<BoardVO> list = sqlSession.selectList("b.board_search_tc" ,map);
		return list;
	}
	
	//제목+내용 검색갯수
	public int getSearchTotaltc(String keyword) {
		int cnt = sqlSession.selectOne("b.count_page_search_tc", keyword);
		return cnt;
	}
	
	//아이디로검색
	public List<BoardVO> board_search_id(Map<String, Object> map){
		List<BoardVO> list = sqlSession.selectList("b.board_search_id" ,map);
		return list;
	}
	
	//아이디 검색갯수
	public int getSearchTotalid(String keyword) {
		int cnt = sqlSession.selectOne("b.count_page_search_id", keyword);
		return cnt;
	}

}
