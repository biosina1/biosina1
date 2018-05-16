package com.javalec.sangho.dao;

import com.javalec.sangho.vo.MemberVO;

public interface MemberDAO {

	public void insertMember(MemberVO vo);

	public int checkId(String userid);
}
