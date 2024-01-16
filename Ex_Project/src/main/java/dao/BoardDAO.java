package dao;

import java.util.HashMap;
import java.util.List;

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

}
