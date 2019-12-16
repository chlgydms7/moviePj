package com.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Movie_payDAO {
	
	private Connection conn;

	public Movie_payDAO(Connection conn) {
		this.conn = conn;
	}
	
	public Movie_payDTO getReadData(String userId) {
		
		Movie_payDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select userId,payMethod,payInfo from Movie_pay where userId=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new Movie_payDTO();
				
				dto.setUserId(rs.getString("userId"));
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
