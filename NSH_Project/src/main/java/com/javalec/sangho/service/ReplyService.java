package com.javalec.sangho.service;

import java.util.List;

import com.javalec.sangho.vo.BoardVO;
import com.javalec.sangho.vo.PageVO;
import com.javalec.sangho.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> list(int bno) throws Exception;

	public void insert(ReplyVO vo) throws Exception;

	public void update(ReplyVO vo) throws Exception;

	public void delete(int seq) throws Exception;

	public List<ReplyVO> listPage(int bno, PageVO vo);

	public int count(int bno) throws Exception;
}