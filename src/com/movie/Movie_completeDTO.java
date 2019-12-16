package com.movie;

public class Movie_completeDTO {
	
	private String userId;
	private int reserveNum;
	private String movietype;
	private String timetype;
	private int roomtype;
	private int cost;
	private int sitnum;
	private String payMethod;
	private String payInfo;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getReserveNum() {
		return reserveNum;
	}
	public void setReserveNum(int reserveNum) {
		this.reserveNum = reserveNum;
	}
	public String getMovietype() {
		return movietype;
	}
	public void setMovietype(String movietype) {
		this.movietype = movietype;
	}
	public String getTimetype() {
		return timetype;
	}
	public void setTimetype(String timetype) {
		this.timetype = timetype;
	}
	public int getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(int roomtype) {
		this.roomtype = roomtype;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getSitnum() {
		return sitnum;
	}
	public void setSitnum(int sitnum) {
		this.sitnum = sitnum;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getPayInfo() {
		return payInfo;
	}
	public void setPayInfo(String payInfo) {
		this.payInfo = payInfo;
	}

}
