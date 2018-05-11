package com.javalec.sangho.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.javalec.sangho.dao.MemberDAO;
import com.javalec.sangho.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MemberDAOTest {

	@Inject
	private MemberDAO dao;

/*	@Test
	public void testTime() throws Exception {
		System.out.println(dao.getTime());
	}
*/
	@Test
	public void testInsertMember() throws Exception {
		MemberVO vo = new MemberVO();
		vo.setUserid("id");
		vo.setUserpw("pw");
		vo.setUsername("name");
		vo.setAddrcode("code");
		vo.setAddr("addr");
		vo.setAddr2("addr2");
		vo.setPhone("phone");
		vo.setEmail("email");

		dao.insertMember(vo);
	}
}
