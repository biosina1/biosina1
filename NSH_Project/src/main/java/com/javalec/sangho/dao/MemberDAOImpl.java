package com.javalec.sangho.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.sangho.vo.LoginVO;
import com.javalec.sangho.vo.MemberVO;

/*DAO를 스프링에 인식시키기 위해 사용*/

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "org.com.javalec.sangho.MemberMapper";

	@Override
	public void insert(MemberVO vo) {
		sqlSession.insert(namespace + ".insert", vo);
	}

	@Override
	public List<MemberVO> select() {
		return sqlSession.selectList(namespace + ".select");
	}

	@Override
	public void update(MemberVO vo) {
		sqlSession.insert(namespace + ".update", vo);
	}

	@Override
	public void delete(int seq) {
		sqlSession.insert(namespace + ".delete", seq);
	}

	@Override
	public int checkId(String userid) {
		return sqlSession.selectOne(namespace + ".checkId", userid);
	}

	@Override
	public int checkLogin(LoginVO vo) {
		 return sqlSession.selectOne(namespace + ".login", vo);
	}
}
