package com.javalec.sangho.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javalec.sangho.vo.PageMakerVO;
import com.javalec.sangho.vo.PageVO;
import com.javalec.sangho.vo.ProductVO;


public interface ProductService {
	public void insert(ProductVO vo) throws Exception;

	public void update(ProductVO vo) throws Exception;

	public void delete(int seq) throws Exception;

	public List<ProductVO> select(PageVO vo,String p_category) throws Exception;

	public int countPage(String p_category) throws Exception;
}
