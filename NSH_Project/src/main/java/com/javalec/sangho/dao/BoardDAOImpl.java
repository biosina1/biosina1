package com.javalec.sangho.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.sangho.vo.BoardVO;
import com.javalec.sangho.vo.PageVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlsession;

	private static String namespace = "org.com.javalec.sangho.BoardMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		sqlsession.insert(namespace + ".create", vo);

	}

	@Override
	public BoardVO read(int seq) throws Exception {
		return sqlsession.selectOne(namespace + ".read", seq);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sqlsession.update(namespace + ".update", vo);
	}

	@Override
	public void hitup(int seq) throws Exception {
		sqlsession.update(namespace + ".hit_update", seq);
	}

	@Override
	public void delete(int seq) throws Exception {
		sqlsession.delete(namespace + ".delete", seq);
	}

	@Override
	public List<BoardVO> listAll(String type) throws Exception {
		return sqlsession.selectList(namespace + ".listAll", type);
	}

	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		return sqlsession.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<BoardVO> listPage2(PageVO vo) throws Exception {
		return sqlsession.selectList(namespace + ".listPage2", vo);
	}
	
	@Override
	public int countPage(PageVO vo) throws Exception{
		return sqlsession.selectOne(namespace + ".countPage", vo);
	}
}
