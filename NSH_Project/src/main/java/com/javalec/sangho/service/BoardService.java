package com.javalec.sangho.service;

import java.util.List;

import com.javalec.sangho.vo.BoardVO;

public interface BoardService {
	public void create(BoardVO vo) throws Exception;

	public BoardVO read(int seq) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(int seq) throws Exception;

	public List<BoardVO> ListAll(String type) throws Exception;
}