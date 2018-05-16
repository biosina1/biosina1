package com.javalec.sangho.testcode;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.javalec.sangho.dao.BoardDAO;
import com.javalec.sangho.dao.MemberDAO;
import com.javalec.sangho.vo.BoardVO;
import com.javalec.sangho.vo.MemberVO;
import com.javalec.sangho.vo.PageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MemberDAOTest {

	@Inject
	private BoardDAO dao;

	/*
	 * @Test public void testTime() throws Exception {
	 * System.out.println(dao.getTime()); }
	 */
	// @Test
	// public void testInsertMember() throws Exception {
	// MemberVO vo = new MemberVO();
	// vo.setUserid("id");
	// vo.setUserpw("pw");
	// vo.setUsername("name");
	// vo.setAddrcode("code");
	// vo.setAddr("addr");
	// vo.setAddr2("addr2");
	// vo.setPhone("phone");
	// vo.setEmail("email");
	//
	// dao.insertMember(vo);
	// }

//	@Test
//	public void testList1() throws Exception {
//		int page = 3;
//		List<BoardVO> list = dao.listPage(page);
//
//		for (BoardVO vo : list) {
//			System.out.println(vo.getContent() + "---------------------------------------");
//		}
//	}

	@Test
	public void testList() throws Exception {
		PageVO vo = new PageVO();
		vo.setPage(1);
		vo.setPerPageNum(10);
		List<BoardVO> list = dao.listPage2(vo);

		for (BoardVO vo2 : list) {
			System.out.println(vo2.getSeq() + " : : " + vo2.getTitle());
		}
	}
	
	
	
}
