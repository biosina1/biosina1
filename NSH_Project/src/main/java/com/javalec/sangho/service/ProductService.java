package com.javalec.sangho.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javalec.sangho.vo.CartListVO;
import com.javalec.sangho.vo.CartVO;
import com.javalec.sangho.vo.OrderProductVO;
import com.javalec.sangho.vo.OrderVO;
import com.javalec.sangho.vo.PageMakerVO;
import com.javalec.sangho.vo.PageVO;
import com.javalec.sangho.vo.ProductVO;

public interface ProductService {
	public void insert(ProductVO vo) throws Exception;

	public void update(ProductVO vo) throws Exception;

	public void delete(int seq) throws Exception;

	public List<ProductVO> select(PageVO vo, String p_category) throws Exception;

	public int countPage(String p_category) throws Exception;

	public ProductVO content(int seq) throws Exception;

	public void hitup(int seq) throws Exception;
	// cart
	public void insertCart(CartVO vo) throws Exception;

	public void updateCart(CartVO vo) throws Exception;

	public void deleteCart(int seq) throws Exception;

	public List<CartListVO> selectCart(int u_seq) throws Exception;
	
	//order
	public void addorder(OrderVO vo) throws Exception;

	public void order_product(OrderProductVO vo) throws Exception;
	
	public List<ProductVO> newitem() throws Exception;

	public List<ProductVO> hititem() throws Exception;
}
