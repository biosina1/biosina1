package com.javalec.sangho.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.sangho.vo.PageVO;
import com.javalec.sangho.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlSession;

	private String namespace = "org.com.javalec.sangho.ReplyMapper";

	public List<ReplyVO> list(int bno) throws Exception {
		return sqlSession.selectList(namespace + ".list", bno);
	}

	public void insert(ReplyVO vo) throws Exception {
		sqlSession.insert(namespace + ".insert", vo);
	}

	public void update(ReplyVO vo) throws Exception {
		sqlSession.update(namespace + ".update", vo);
	}

	public void delete(int seq) throws Exception {
		sqlSession.delete(namespace + ".delete", seq);
	}

	public List<ReplyVO> listPage(int bno, PageVO vo) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("vo", vo);
		return sqlSession.selectList(namespace + ".listPage", paramMap);
	}

	public int count(int bno) throws Exception {
		return sqlSession.selectOne(namespace + ".count", bno);
	}
}
