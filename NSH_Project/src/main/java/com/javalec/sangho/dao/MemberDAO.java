package com.javalec.sangho.dao;

import java.util.List;

import com.javalec.sangho.vo.LoginVO;
import com.javalec.sangho.vo.MemberVO;

public interface MemberDAO {

	public void insert(MemberVO vo);

	public List<MemberVO> select();

	public void update(MemberVO vo);

	public void delete(int seq);

	public int checkId(String userid);
	
	public int checkLogin(LoginVO vi);
	
	public MemberVO userinfo(int seq);
	
}
