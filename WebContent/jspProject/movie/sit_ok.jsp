<%@page import="com.util.DBCPConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.movie.MovieSitDAO"%>
<%@page import="com.movie.MovieSitDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");
String cp =request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 그 이상의 감동. CGV</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<style type="text/css">
body {
	
	font-family: "Nanum Gothic", sans-serif;
	
	}
</style>
</head>
<body>
<%
boolean autocommit=true;
Connection conn=DBCPConn.getConnection();
if(conn.getAutoCommit()){
	conn.setAutoCommit(false);
}
for(int i=0;i<10;i++){
	for(int j=1;j<=10;j++){

		if(Integer.valueOf(request.getParameter("h"+Integer.valueOf((i*10)+j)))==2){
		MovieSitDTO dto=new MovieSitDTO();
		dto.setMovietype(request.getParameter("movietype"));
		dto.setTimetype(request.getParameter("timetype"));
		dto.setRoomtype(Integer.valueOf(request.getParameter("roomtype")));
		dto.setUserId("사용자");
		dto.setSitnum(((i*10)+j));
		MovieSitDAO dao=new MovieSitDAO(conn);
		if(dao.insert(dto)!=1){//키값 오류시
				autocommit=false;
			}
		}
	}
}
if(autocommit){
	conn.commit();
	conn.setAutoCommit(true);
}else{
	conn.rollback();
	conn.setAutoCommit(true);
}
%>
</body>
</html>