package com.movie;

import java.util.Date;

public class Movie_AppraisalDTO {
public int getWrite_num() {
		return write_num;
	}
	public void setWrite_num(int write_num) {
		this.write_num = write_num;
	}
	public String getMovietype() {
		return movietype;
	}
	public void setMovietype(String movietype) {
		this.movietype = movietype;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userid) {
		this.userId = userid;
	}
	public int getStar_select() {
		return star_select;
	}
	public void setStar_select(int star_select) {
		this.star_select = star_select;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	//	write_num number(5),
//	movietype varchar2(10),
//	userid varchar2(10),
//	star_select number(10),
//	msg varchar2(300),
//	writedate date,
	int write_num ;
	String movietype ;
	String userId;
	int star_select ;
	String msg;
	Date writedate;
}
