package com.javalec.sangho.vo;

public class PageVO {
	private int page;
	private int perPageNum;

	public PageVO() {
		this.page = 1;
		this.perPageNum = 10;
	}

	// 한 페이지당 보여지는 게시글 수
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public void setPage(int page) {
		if (page <= 0) {
			page = 1;
			return;
		}
		this.page = page;
	}

	public int getPage() {
		return page;
	}

	// Mybatis SQL

	public int getPageStart() {
		// ex] 1 page = limit 0,10
		System.out.println("페이지 : " + (this.page - 1) * perPageNum);
		return (this.page - 1) * perPageNum;
	}

	public int getPerPageNum() {
		System.out.println(this.perPageNum);
		return this.perPageNum;
	}

}
