package com.javalec.sangho.service;

import java.util.List;

import com.javalec.sangho.vo.BoardVO;
import com.javalec.sangho.vo.PageVO;

public interface BoardService {
	public void create(BoardVO vo) throws Exception;

	public BoardVO read(int seq) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(int seq) throws Exception;
	
	public void hitup(int seq) throws Exception;

	public List<BoardVO> ListAll(String type) throws Exception;
	
	public List<BoardVO> listPage2(PageVO vo) throws Exception;
	
	public int pageCount(PageVO vo) throws Exception;
}
