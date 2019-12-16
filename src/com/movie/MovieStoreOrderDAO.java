package com.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.net.aso.f;

public class MovieStoreOrderDAO {
	
	Connection conn  = null;
	public MovieStoreOrderDAO(Connection conn) {this.conn=conn;}
	
	//장바구니를 클릭하였을때 데이터를 삽입하는 쿼리문 
	public int OrderInsertData(MovieStoreOrderDTO dto) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql =  "insert into movie_store_order ";
			sql += "(order_number,userid,amount,storeSum,num) values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,dto.getOrder_number());
			pstmt.setString(2,dto.getUserid());
			pstmt.setInt(3,dto.getAmount());
			pstmt.setInt(4,dto.getStoreSum());
			pstmt.setInt(5,dto.getNum());
			result = pstmt.executeUpdate();		
		}catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			  if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
		}
		
		return result; 
	}
	//결제를 했을때 데이터가 수정하는 메소드 
	public int OrderUpdateData(String userid,String cardType) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {			
			sql =  "update movie_store_order set ";
			sql += "paymentDate=sysdate,cardType=? where userid = ? and paymentDate is null";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,cardType);
			pstmt.setString(2,userid);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			  if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
		}
		return result;
	}
	//장바구니 리스트를 보여주는 메소드 
	public List<MovieStoreOrderDTO> ordergetList(String userId){		
		List<MovieStoreOrderDTO> orderlists = new ArrayList<MovieStoreOrderDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql; 
		try {	
			sql  = "select order_number,movie_store.num num,saveFileName,subject,price,amount,storeSum,cardType,paymentDate ";
			sql += "from movie_store,movie_store_order where movie_store.num=movie_store_order.num and paymentDate is null and userId = ?";
			sql += "order by order_number ";
			//sql += "where userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			//pstmt.setString(1,userid);
			rs = pstmt.executeQuery();
			MovieStoreOrderDTO orderdto = null;
			while(rs.next()) {
				orderdto = new MovieStoreOrderDTO();
				orderdto.setOrder_number(rs.getInt("order_number"));		
				orderdto.setNum(rs.getInt("num"));
				
				orderdto.setSaveFileName(rs.getString("saveFileName"));
				orderdto.setSubject(rs.getString("subject"));
				orderdto.setPrice(rs.getInt("price"));
				orderdto.setAmount(rs.getInt("amount"));
				orderdto.setStoreSum(rs.getInt("storeSum"));
				orderdto.setPaymentDate(rs.getString("paymentDate"));
				orderdto.setCardType(rs.getString("cardType"));
				orderlists.add(orderdto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){};
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
		}
		return orderlists;	
	}
	
	public List<MovieStoreOrderDTO> paymentgetList(String userId){
		System.out.println("paymentList userId : "+userId);
		List<MovieStoreOrderDTO> orderlists = new ArrayList<MovieStoreOrderDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql; 
		try {	
			sql  = "select order_number,userid,movie_store.num num,saveFileName,subject,price,amount,storeSum,cardType,to_char(paymentDate,'yyyy-mm-dd hh24:mi') paymentDate  ";
			sql += " from movie_store,movie_store_order where movie_store.num=movie_store_order.num and paymentDate is not null and userid=? order by order_number ";
			//sql += "where userid=?";
			System.out.println("paymentgetList : " + userId);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			//pstmt.setString(1,userid);
			rs = pstmt.executeQuery();
			MovieStoreOrderDTO orderdto = null;
			while(rs.next()) {
				orderdto = new MovieStoreOrderDTO();
				orderdto.setOrder_number(rs.getInt("order_number"));
				orderdto.setUserid(rs.getString("userid"));			
				orderdto.setNum(rs.getInt("num"));
				orderdto.setSaveFileName(rs.getString("saveFileName"));
				orderdto.setSubject(rs.getString("subject"));
				orderdto.setPrice(rs.getInt("price"));
				orderdto.setAmount(rs.getInt("amount"));
				orderdto.setStoreSum(rs.getInt("storeSum"));
				orderdto.setPaymentDate(rs.getString("paymentDate"));
				orderdto.setCardType(rs.getString("cardType"));
				orderlists.add(orderdto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){};
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
		}
		return orderlists;	
	}
	
	//장바구니를 지우는 쿼리문 
	public int orderDateDelete(int order_number) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "delete movie_store_order where order_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,order_number);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
		}
		return result;
	}
	public int getMaxNum() {
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select nvl(max(order_number),0) from movie_store_order";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){maxNum = rs.getInt(1);}
		}catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			  if(rs!=null)try{rs.close();}catch(SQLException ex){}
			  if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		}
		return maxNum;
	}
}
