package com.javalec.sangho.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.sangho.dao.MemberDAO;
import com.javalec.sangho.vo.LoginVO;
import com.javalec.sangho.vo.MemberVO;

@Service
public class MemberServlceImpl implements MemberService {
	@Inject
	private MemberDAO dao;

	public void insert(MemberVO vo) {
		dao.insert(vo);
	}

	public List<MemberVO> select() {
		return dao.select();
	}

	public void update(MemberVO vo) {
		dao.update(vo);
	}

	public void delete(int seq) {
		dao.delete(seq);
	}

	public int checkId(String userid) {
		return dao.checkId(userid);
	}
	
	public int checkLogin(LoginVO vo) {
		return dao.checkLogin(vo);
	}
	
	public MemberVO userinfo(int seq) {
		return dao.userinfo(seq);
	}
}
