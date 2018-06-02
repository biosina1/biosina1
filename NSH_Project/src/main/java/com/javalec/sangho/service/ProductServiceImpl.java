package com.javalec.sangho.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.sangho.dao.ProductDAO;
import com.javalec.sangho.vo.CartListVO;
import com.javalec.sangho.vo.CartVO;
import com.javalec.sangho.vo.OrderProductVO;
import com.javalec.sangho.vo.OrderVO;
import com.javalec.sangho.vo.OrderpVO;
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

	public ProductVO content(int seq) throws Exception {
		return dao.content(seq);
	}

	public void hitup(int seq) throws Exception {
		dao.hitup(seq);
	}

	// 장바구니
	public void insertCart(CartVO vo) throws Exception {
		dao.insertCart(vo);
	}

	public void updateCart(CartVO vo) throws Exception {
		dao.updateCart(vo);
	}

	public void deleteCart(int seq) throws Exception {
		dao.deleteCart(seq);
	}

	public List<CartListVO> selectCart(int u_seq) throws Exception {
		return dao.selectCart(u_seq);
	}

	// 주문
	public void addorder(OrderVO vo) throws Exception {
		dao.addorder(vo);
	}

	public void order_product(OrderProductVO vo) throws Exception {
		dao.order_product(vo);
	}

	public List<OrderVO> order(int u_seq) throws Exception {
		return dao.order(u_seq);
	}

	public List<OrderpVO> orderp(int u_seq) throws Exception {
		return dao.orderp(u_seq);
	}

	public List<ProductVO> newitem() throws Exception {
		return dao.newitem();
	}

	public List<ProductVO> hititem() throws Exception {
		return dao.hititem();

	}
}
