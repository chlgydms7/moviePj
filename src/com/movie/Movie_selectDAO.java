package com.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Movie_selectDAO {
	/*movietype varchar2(30),
	timetype varchar2(30),
	roomtype number(5),
	cost number(10)*/
	private Connection conn;
	public Movie_selectDAO(Connection conn) {
		this.conn=conn;
	}
	public List<Movie_selectDTO> getDataList(){
		List<Movie_selectDTO> lists=new ArrayList<Movie_selectDTO>();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs=null;
		try {
			sql="select movietype, timetype, roomtype, cost from movie_select order by movietype";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Movie_selectDTO dto=new Movie_selectDTO();
				dto.setMovietype(rs.getString("movietype"));
				dto.setTimetype(rs.getString("timetype"));
				dto.setRoomtype(rs.getInt("roomtype"));
				dto.setCost(rs.getInt("cost"));
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
	public List<Movie_countDTO> getDataCount(){
		List<Movie_countDTO> lists=new ArrayList<Movie_countDTO>();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs=null;
		try {
			sql="select movietype,count(*) count from movie_select group by movietype";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Movie_countDTO dto=new Movie_countDTO();
				dto.setMovietype(rs.getString("movietype"));
				dto.setCount(rs.getInt("count"));
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
	public int getcost(String movietype,String timetype,int roomtype) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs=null;
		try {
			sql="select cost from movie_select where movietype=? and timetype=? and roomtype=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, movietype);
			pstmt.setString(2, timetype);
			pstmt.setInt(3, roomtype);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				result=rs.getInt("cost");
			}
			rs.close();
			pstmt.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return result;
	}
	
}
