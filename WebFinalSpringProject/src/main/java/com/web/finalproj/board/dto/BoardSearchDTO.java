package com.web.finalproj.board.dto;

public class BoardSearchDTO {
	private String searchtype;
	private String search;
	
	public BoardSearchDTO() {}
	
	public String getSearchtype() {
		return searchtype;
	}
	
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}
	
	public String getSearch() {
		return search;
	}
	
	public void setSearch(String search) {
		this.search = search;
	}
}
