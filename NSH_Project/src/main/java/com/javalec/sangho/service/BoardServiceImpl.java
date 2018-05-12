package com.javalec.sangho.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.sangho.dao.BoardDAO;
import com.javalec.sangho.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardDAO, BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public List<BoardVO> ListAll(String type) throws Exception {
		return dao.listAll(type);
	}

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

	@Override
	public List<BoardVO> listAll(String type) throws Exception {
		return dao.listAll(type);
	}

}
