package com.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MovieTicketDAO {

	private Connection conn;

	public MovieTicketDAO(Connection conn) {
		this.conn = conn;
	}

	// 회원정보 입력(회원가입)
	public void insertData(MovieTicketDTO dto) {

		int result =0;
		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into movie_users(userName, userId, userPwd, ";
			sql+= "userBirth, userTel, userEmail) values (?,?,?,?,?,?) ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserName());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getUserPwd());
			pstmt.setString(4, dto.getUserBirth());
			pstmt.setString(5, dto.getUserTel());
			pstmt.setString(6, dto.getUserEmail());


			result = pstmt.executeUpdate();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	// id로 1명의 유저정보 selecting
	public MovieTicketDTO getReadData(String userId) {

		MovieTicketDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select userName, userId, userPwd, to_char(userBirth, 'yyyymmdd') userBirth, ";
			sql+= "SUBSTR(REGEXP_REPLACE(userTel, '(-| |\\.)',''),1,14) userTel, ";
			sql+= "userEmail from movie_users where userId=? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new MovieTicketDTO();

				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserTel(rs.getString("userTel"));
				dto.setUserEmail(rs.getString("userEmail"));
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}


	// userName으로 1명의 정보 selecting
	public MovieTicketDTO getReadDataByName(String userName) {

		MovieTicketDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select userName, userId, userPwd, to_char(userBirth, 'yyyymmdd') userBirth, ";
			sql+= "SUBSTR(REGEXP_REPLACE(userTel, '(-| |\\.)',''),1,14) userTel, ";
			sql+= "userEmail from movie_users where userName=? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new MovieTicketDTO();

				dto.setUserName(rs.getString("userName"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setUserBirth(rs.getString("userBirth"));
				dto.setUserTel(rs.getString("userTel"));
				dto.setUserEmail(rs.getString("userEmail"));
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	
	public int update(MovieTicketDTO dto) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			
			sql = "update movie_users set userName=?, userPwd=?, ";
			sql+= "userBirth=?, userTel=?, userEmail=? where userId=? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserName());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserBirth());
			pstmt.setString(4, dto.getUserTel());
			pstmt.setString(5, dto.getUserEmail());
			pstmt.setString(6, dto.getUserId());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}





}
