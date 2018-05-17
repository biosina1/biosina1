package com.javalec.sangho.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.sangho.dao.BoardDAO;
import com.javalec.sangho.dao.ReplyDAO;
import com.javalec.sangho.vo.BoardVO;
import com.javalec.sangho.vo.PageVO;
import com.javalec.sangho.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;

	public List<ReplyVO> list(int bno) throws Exception {
		return dao.list(bno);
	}

	public void insert(ReplyVO vo) throws Exception {
		dao.insert(vo);
	}

	public void update(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

	public void delete(int seq) throws Exception {
		dao.delete(seq);
	}

	public List<ReplyVO> listPage(int bno, PageVO vo) {
		return dao.listPage(bno, vo);
	}

	public int count(int bno) throws Exception {
		return dao.count(bno);
	}
}
