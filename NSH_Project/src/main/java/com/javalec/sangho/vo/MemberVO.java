package com.javalec.sangho.vo;

import java.sql.Date;

public class MemberVO {

	private String userid;
	private String userpw;
	private String username;
	private String useraddcode;
	private String useraddr;
	private String useraddr2;
	private Date userdate;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseraddcode() {
		return useraddcode;
	}

	public void setUseraddcode(String useraddcode) {
		this.useraddcode = useraddcode;
	}

	public String getUseraddr() {
		return useraddr;
	}

	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}

	public String getUseraddr2() {
		return useraddr2;
	}

	public void setUseraddr2(String useraddr2) {
		this.useraddr2 = useraddr2;
	}

	public Date getUserdate() {
		return userdate;
	}

	public void setUserdate(Date userdate) {
		this.userdate = userdate;
	}
}
