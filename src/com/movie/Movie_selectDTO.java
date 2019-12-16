package com.movie;

public class Movie_selectDTO {
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
	public String getTimetype() {
		return timetype;
	}
	public void setTimetype(String timetype) {
		this.timetype = timetype;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	int roomtype;
	String movietype;
	String timetype;
	int cost;
	
	/*movietype varchar2(30),
	timetype varchar2(30),
	roomtype number(5),
	cost number(10)*/
}
