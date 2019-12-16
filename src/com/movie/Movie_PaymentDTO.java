package com.movie;

public class Movie_PaymentDTO {
	
	String movietype;
	String timetype;
	int roomtype;
	int sitnum;
	String userId;
	String payMethod;
	int reserveNum;
	
	
	
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
	public String getMovietype() {
		return movietype;
	}
	public void setMovietype(String movietype) {
		this.movietype = movietype;
	}
	public int getSitnum() {
		return sitnum;
	}
	public void setSitnum(int sitnum) {
		this.sitnum = sitnum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userid) {
		this.userId = userid;
	}
	
	
	
	public int getReserveNum() {
		return reserveNum;
	}
	public void setReserveNum(int reserveNum) {
		this.reserveNum = reserveNum;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	

}
