package com.javalec.sangho.vo;

public class PageMakerVO {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private PageVO pagevo;

	public void setPageVO(PageVO vo) {
		this.pagevo = vo;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcDate();
	}

	public void calcDate() {
		endPage = (int) (Math.ceil(pagevo.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) pagevo.getPerPageNum()));
		
		if(endPage > tempEndPage)
			endPage = tempEndPage;

		prev = startPage == 1 ? false : true;
		next = endPage * pagevo.getPerPageNum() >= totalCount ? false : true;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public PageVO getPagevo() {
		return pagevo;
	}

	public void setPagevo(PageVO pagevo) {
		this.pagevo = pagevo;
	}

	public int getTotalCount() {
		return totalCount;
	}
	
	

}
