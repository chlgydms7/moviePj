package com.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Movie_completeDAO {
	
	private Connection conn;

	public Movie_completeDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int insertData(Movie_completeDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "insert into movie_complete (userId,reserveNum,movietype,timetype,roomtype,cost,sitnum,payMethod,payInfo) ";
			sql += "values (?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setInt(2, dto.getReserveNum());
			pstmt.setString(3, dto.getMovietype());
			pstmt.setString(4, dto.getTimetype());
			pstmt.setInt(5, dto.getRoomtype());
			pstmt.setInt(6, dto.getCost());
			pstmt.setInt(7, dto.getSitnum());
			pstmt.setString(8, dto.getPayMethod());
			pstmt.setString(9, dto.getPayInfo());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public Movie_completeDTO getData(String userId) {
		
		Movie_completeDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select userId,reserveNum,movietype,timetype,roomtype,cost,sitnum,payMethod,payInfo ";
			sql = "from movie_complete where userId=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new Movie_completeDTO();
				
				dto.setUserId(rs.getString("userId"));
				dto.setReserveNum(rs.getInt("reserveNum"));
				dto.setMovietype(rs.getString("movietype"));
				dto.setTimetype(rs.getString("timetype"));
				dto.setRoomtype(rs.getInt("roomtype"));
				dto.setCost(rs.getInt("cost"));
				dto.setSitnum(rs.getInt("sitnum"));
				dto.setPayMethod(rs.getString("payMethod"));
				dto.setPayInfo(rs.getString("payInfo"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}
