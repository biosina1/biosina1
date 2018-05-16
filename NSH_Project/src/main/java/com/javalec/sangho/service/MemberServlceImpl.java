package com.javalec.sangho.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.javalec.sangho.dao.MemberDAO;

@Service
public class MemberServlceImpl implements MemberService {
	@Inject
	private MemberDAO dao;

	public int checkId(String userid) {
		return dao.checkId(userid);
	}
}
