package com.javalec.sangho.vo;

public class OrderpVO {
	private long orderNum;
	private int p_seq;
	private String p_img;
	private String p_name;
	private String order_count;

	public long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getOrder_count() {
		return order_count;
	}

	public void setOrder_count(String order_count) {
		this.order_count = order_count;
	}

}
