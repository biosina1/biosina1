package com.javalec.sangho.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.sangho.dao.BoardDAO;
import com.javalec.sangho.vo.BoardVO;
import com.javalec.sangho.vo.PageVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public void create(BoardVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public BoardVO read(int seq) throws Exception {
		return dao.read(seq);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(int seq) throws Exception {
		dao.delete(seq);
	}

	public void hitup(int seq) throws Exception {
		dao.hitup(seq);
	}

	@Override
	public List<BoardVO> ListAll(String type) throws Exception {
		return dao.listAll(type);
	}

	@Override
	public List<BoardVO> listPage2(PageVO vo) throws Exception {
		return dao.listPage2(vo);
	}
	
	@Override
	public int pageCount(PageVO vo) throws Exception{
		return dao.countPage(vo);
	}
}
