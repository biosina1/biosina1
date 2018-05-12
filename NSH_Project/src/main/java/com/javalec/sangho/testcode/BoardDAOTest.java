package com.javalec.sangho.testcode;

import java.util.logging.Logger;

import javax.inject.Inject;

import org.apache.log4j.spi.LoggerFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.javalec.sangho.dao.BoardDAO;
import com.javalec.sangho.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;

	@Test
	public void testCreate() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setType("type");
		vo.setTitle("title");
		vo.setContent("content");
		vo.setWriter("writer");
		dao.create(vo);
	}

	// @Test
	// public void testUpdate() throws Exception {
	// BoardVO vo = new BoardVO();
	// vo.setSeq(1);
	// vo.setTitle("한글");
	// vo.setContent("5555");
	// dao.update(vo);
	// }
	//
	// @Test
	// public void read() throws Exception {
	// System.out.println(dao.read(1));
	// }
	//
	// @Test
	// public void delete() throws Exception{
	// dao.delete(2);
	// }
}
