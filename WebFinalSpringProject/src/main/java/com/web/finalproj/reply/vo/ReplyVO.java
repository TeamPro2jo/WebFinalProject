package com.web.finalproj.reply.vo;

import java.util.Date;

public class ReplyVO {
	private int reid;
	private int bid;
	private String recontents;
	private int aid;
	private String aname;
	private Date cdate;
	private Date udate;

	public int getReid() {
		return reid;
	}

	public void setReid(int reid) {
		this.reid = reid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getRecontents() {
		return recontents;
	}

	public void setRecontents(String recontents) {
		this.recontents = recontents;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
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
		return "ReplyVO [reid=" + reid + ", bid=" + bid + ", recontents=" + recontents + ", aid=" + aid
				+ ", aname=" + aname + ", cdate=" + cdate + ", udate=" + udate + "]";
	}

}
