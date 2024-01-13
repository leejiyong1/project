package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class MemberDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MemberVO check(String id) {
		MemberVO vo = sqlSession.selectOne("m.idcheck", id);
		return vo;
	}

}
