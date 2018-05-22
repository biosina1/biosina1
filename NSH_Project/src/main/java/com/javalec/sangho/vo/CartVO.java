package com.javalec.sangho.vo;

import java.sql.Date;

public class CartVO {
	private int seq;
	private int p_seq;
	private int u_seq;
	private int count;
	private Date date;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	public int getU_seq() {
		return u_seq;
	}

	public void setU_seq(int u_seq) {
		this.u_seq = u_seq;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
