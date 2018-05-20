package com.javalec.sangho.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.sangho.dao.ProductDAO;
import com.javalec.sangho.vo.PageMakerVO;
import com.javalec.sangho.vo.PageVO;
import com.javalec.sangho.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO dao;

	public void insert(ProductVO vo) throws Exception {
		dao.insert(vo);
	}

	public void update(ProductVO vo) throws Exception {
		dao.update(vo);
	}

	public void delete(int seq) throws Exception {
		dao.delete(seq);
	}

	public List<ProductVO> select(PageVO vo, String p_category) throws Exception {
		return dao.select(vo, p_category);
	}

	public int countPage(String p_category) throws Exception {
		return dao.countPage(p_category);
	}
}
