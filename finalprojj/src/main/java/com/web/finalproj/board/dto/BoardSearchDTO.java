package com.web.finalproj.board.dto;

public class BoardSearchDTO {
	private String[] typeList;
	private String[] areaList;
	private String[] statList;
	private String[] dealList;
	private String type;
	private String area;
	private String stat;
	private String deal;
	private String searchType;
	private String searchWord;
	
	public String[] getTypeList() {
		return typeList;
	}
	public void setTypeList(String[] typeList) {
		this.typeList = typeList;
	}
	public String[] getAreaList() {
		return areaList;
	}
	public void setAreaList(String[] areaList) {
		this.areaList = areaList;
	}
	public String[] getStatList() {
		return statList;
	}
	public void setStatList(String[] statList) {
		this.statList = statList;
	}
	public String[] getDealList() {
		return dealList;
	}
	public void setDealList(String[] dealList) {
		this.dealList = dealList;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getDeal() {
		return deal;
	}
	public void setDeal(String deal) {
		this.deal = deal;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
}
