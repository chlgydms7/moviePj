package com.movie;

public class MovieSitDTO {
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
	String movietype;
	String timetype;
	int roomtype;
	int sitnum;
	String userId;
	

}
