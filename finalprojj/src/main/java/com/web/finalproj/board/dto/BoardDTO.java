package com.web.finalproj.board.dto;

import java.sql.Date;

public class BoardDTO {
	private int bid;
	private String aid;
	private String aname;
	private String title;
	private String contents;
	private int deal;
	private String location;
	private String category;
	private String status;
	private int price;
	private int vcnt;
	private Date cdate;
	private Date udate;
	
	public BoardDTO() {}
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getDeal() {
		return deal;
	}
	public void setDeal(int deal) {
		this.deal = deal;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getVcnt() {
		return vcnt;
	}
	public void setVcnt(int vcnt) {
		this.vcnt = vcnt;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public Date getUdate() {
		return udate;
	}
	public void setUdate(Date udate) {
		this.udate = udate;
	}

	@Override
	public String toString() {
		return "BoardDTO [bid=" + bid + ", aid=" + aid + ", aname=" + aname + ", title=" + title + ", contents="
				+ contents + ", deal=" + deal + ", location=" + location + ", category=" + category + ", status="
				+ status + ", price=" + price + ", vcnt=" + vcnt + ", cdate=" + cdate + ", udate=" + udate + "]";
	}
	
	
	
}
