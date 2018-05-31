package com.javalec.sangho.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javalec.sangho.vo.LoginVO;
import com.javalec.sangho.vo.MemberVO;

public interface MemberService {

	public void insert(MemberVO vo);

	public List<MemberVO> select();

	public void update(MemberVO vo);

	public void delete(int seq);

	public int checkId(String userid);

	public int checkLogin(LoginVO vo);
	
	public MemberVO userinfo(int seq);
}
