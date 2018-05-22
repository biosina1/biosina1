package com.javalec.sangho.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.sangho.vo.CartListVO;
import com.javalec.sangho.vo.CartVO;
import com.javalec.sangho.vo.PageMakerVO;
import com.javalec.sangho.vo.PageVO;
import com.javalec.sangho.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sqlsession;

	private static String namespace = "org.com.javalec.sangho.productMapper";

	public void insert(ProductVO vo) throws Exception {
		sqlsession.insert(namespace + ".insert", vo);
	}

	public void update(ProductVO vo) throws Exception {
		sqlsession.insert(namespace + ".update", vo);
	}

	public void delete(int seq) throws Exception {
		sqlsession.insert(namespace + ".delete", seq);
	}

	public List<ProductVO> select(PageVO vo, String p_category) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("vo", vo);
		map.put("p_category", p_category);
		return sqlsession.selectList(namespace + ".select", map);
	}

	public int countPage(String p_category) throws Exception {
		return sqlsession.selectOne(namespace + ".countPage", p_category);
	}

	public ProductVO content(int seq) throws Exception {
		return sqlsession.selectOne(namespace + ".content", seq);
	}

	// 장바구니

	public void insertCart(CartVO vo) throws Exception {
		sqlsession.insert(namespace + ".insertCart", vo);
	}

	public void updateCart(CartVO vo) throws Exception {
		sqlsession.update(namespace + ".updateCart", vo);
	}

	public void deleteCart(int seq) throws Exception {
		sqlsession.delete(namespace + ".deleteCart", seq);
	}

	public List<CartListVO> selectCart(int u_seq) throws Exception {
		return sqlsession.selectList(namespace + ".selectCart", u_seq);
	}
}
