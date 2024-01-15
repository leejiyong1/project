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
	
	public int join(MemberVO vo) {
		int res = sqlSession.insert("m.join_insert", vo);
		return res;
	}
	
	public MemberVO login(String id) {
		MemberVO vo = sqlSession.selectOne("m.login", id);
		return vo;
	}

}
