package com.javalec.sangho.dao;

import java.util.List;

import com.javalec.sangho.vo.CartListVO;
import com.javalec.sangho.vo.CartVO;
import com.javalec.sangho.vo.OrderProductVO;
import com.javalec.sangho.vo.OrderVO;
import com.javalec.sangho.vo.OrderpVO;
import com.javalec.sangho.vo.PageMakerVO;
import com.javalec.sangho.vo.PageVO;
import com.javalec.sangho.vo.ProductVO;

public interface ProductDAO {

	public void insert(ProductVO vo) throws Exception;

	public void update(ProductVO vo) throws Exception;

	public void delete(int seq) throws Exception;

	public List<ProductVO> select(PageVO vo, String p_category) throws Exception;

	public int countPage(String p_category) throws Exception;

	public ProductVO content(int seq) throws Exception;

	public void hitup(int seq) throws Exception;

	// Cart
	public void insertCart(CartVO vo) throws Exception;

	public void updateCart(CartVO vo) throws Exception;

	public void deleteCart(int seq) throws Exception;

	public void deleteCart2(int u_seq) throws Exception;

	public List<CartListVO> selectCart(int u_seq) throws Exception;

	// Order
	public void addorder(OrderVO vo) throws Exception;

	public void order_product(OrderProductVO vo) throws Exception;

	// Order List
	public List<OrderVO> order(int u_seq) throws Exception;

	public List<OrderpVO> orderp(int u_seq) throws Exception;

	public List<OrderVO> allorderlist() throws Exception;

	public void orderupdate(long orderNum, String status) throws Exception;

	// New and Hit Item
	public List<ProductVO> newitem() throws Exception;

	public List<ProductVO> hititem() throws Exception;
}
