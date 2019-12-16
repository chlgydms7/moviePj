package com.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class Movie_AppraisalDAO {
	private Connection conn;
	public Movie_AppraisalDAO(Connection conn) {
		this.conn=conn;
	}
	public void insertData(Movie_AppraisalDTO dto) {
		PreparedStatement pstmt = null;
		String sql;
		try {
//			write_num number(5),
//			movietype varchar2(10),
//			userid varchar2(10),
//			star_select number(10),
//			msg varchar2(300),
//			writedate date,
			sql="insert into movie_appraisal (write_num,movietype,userid,star_select,msg,writedate) values (?,?,?,?,?,sysdate)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, this.getMaxNum()+1);
			pstmt.setString(2, dto.getMovietype());
			pstmt.setString(3, dto.userId);
			pstmt.setInt(4, dto.star_select);
			pstmt.setString(5, dto.msg);
			pstmt.executeUpdate();
			pstmt.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
	}
	public int countData(String movietype) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs=null;
		try {
		sql="select count(*) from movie_appraisal where movietype=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, movietype);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			result=rs.getInt(1);
		}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return result;
	}
	public List<Movie_AppraisalDTO> getList(int start,int end,String movietype){
		List<Movie_AppraisalDTO> lists=new ArrayList<Movie_AppraisalDTO>();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs=null;
		try {
		sql="select * from (select rownum rnum, data.* from (select write_num, movietype, userid, star_select, msg, writedate from movie_appraisal where movietype = ? "
				+ "order by write_num) data) where rnum>=? and rnum<=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, movietype);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			Movie_AppraisalDTO dto=new Movie_AppraisalDTO();
			dto.setWrite_num(rs.getInt("write_num"));
			dto.setMovietype(rs.getString("movietype"));
			dto.setUserId(rs.getString("userid"));
			dto.setStar_select(rs.getInt("star_select"));
			dto.setMsg(rs.getString("msg"));
			dto.setWritedate(rs.getDate("writedate"));
			lists.add(dto);
		}
		rs.close();
		pstmt.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return lists;
	}
	public int getMaxNum() {
		int result=1;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs=null;
		try {
		sql="select nvl(Max(write_num),0) from movie_appraisal";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			result=rs.getInt(1);
		}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return result;
	}
}
