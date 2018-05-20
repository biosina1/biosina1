package com.javalec.sangho.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
		return sqlsession.insert(namespace + ".countPage", p_category);
	}

}
