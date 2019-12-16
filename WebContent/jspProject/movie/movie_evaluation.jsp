<%@page import="java.net.URLDecoder"%>
<%@page import="com.movie.Movie_AppraisalDAO"%>
<%@page import="com.movie.Movie_AppraisalDTO"%>
<%@page import="com.util.DBCPConn"%>
<%@page import="java.util.List"%>
<%@page import="com.util.Myutil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%request.setCharacterEncoding("UTF-8");
String cp =request.getContextPath();
List<Movie_AppraisalDTO> lists=(List<Movie_AppraisalDTO>)request.getAttribute("lists");
int dataCount=((Integer)request.getAttribute("dataCount")).intValue();
String pageIndexList=(String)request.getAttribute("pageIndexList");
String movietype=(String)request.getAttribute("movietype");
//request.setAttribute("movietype", movietype);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<title>영화 그 이상의 감동. CGV</title>

<style type="text/css">

/* 기본 css */
a { text-decoration: none}

.nav {

	text-align: center;
}

body {
	
	font-family: "Nanum Gothic", sans-serif;
	
	}

#content {
	
	width: 1000px;
	height: 1500px;
	margin-left: 400px;
	margin-right: 500px;
}

#header { 
	
	
 	width: 1000px;
	height: 130px; 
	padding-left: 300px;
	padding-right: 300px; 

}

.head {

	width: 1920px;
	height: 130px; 
	padding-left: 400px;
	padding-right: 500px;
	margin-left: 0px;
	margin-right: 0px; 
}

.login{
	
	font-size: 9pt;

}

.floating{
position: fixed;
right: 50%;
top: 200px;
margin-right: -660px;
text-align: center;
width: 180px;

}

/* -----------------여기까지----------------- */

* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}

/* .mySlides { display: none;} */

img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

</style>

</head>
<body style="background-color: #FDFCF0">

<div class="login" style="margin-left:350px; width: 1000px;" align="right">
		<c:choose>
		<c:when test="${empty sessionScope.customInfo.userId }">
			<div class="login" style=" width: 1000px; height: 20px;" align="right">
				<a href="<%=cp%>/movie/login.do" style="color: black"><b>로그인</b></a>
				&nbsp;
				<a href="<%=cp%>/movie/signConfirm.do" style="color: black"><b>회원가입</b></a>
				&nbsp;
				<a href="<%=cp%>/movie/login.do" style="color: black"><b>My CGV</b></a>
			</div>
		</c:when> 
		<c:otherwise>
		<div class="login" style="margin-left:350px; width: 1000px; height: 20px;" align="right">
				<b>${sessionScope.customInfo.userId }님 반갑습니다.</b>
				<a href="<%=cp%>/movie/logout.do" style="color: black"><b>로그아웃</b></a>
				&nbsp;&nbsp;
				<a href="<%=cp%>/movie/updated.do" style="color: black"><b>My CGV</b></a>
				&nbsp;&nbsp;
				<a href="<%=cp%>/movie/moviebill.do" style="color: black"><b>영화 주문정보</b></a>
				&nbsp;&nbsp;
				<a href="<%=cp%>/store/bill.do" style="color: black"><b>스토어 주문정보</b></a>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<img src="<%=cp %>/jspProject/image/Gline.png">
<div class="head" style="background-color: #FEF8DC; margin-right: 0px;">
	<div>
			<div style="display: inline-block; float: left; width: 20%" >
				<h1 align="left" >
				<a href="<%=cp%>/movie/main.do"><img style="padding-left: 20px;" src="<%=cp %>/jspProject/image/cgvLogo.png"></a>
				</h1>
			</div>
			<div style="display: inline-block; margin-top:10px; float: left; width: 80%" > 
				<h3 align="center" style="width: 550px; margin-left: 50px; margin-right: 0;">
					<img src="<%=cp %>/jspProject/image/cultureplex.png">
				</h3>
				<div id="nav" align="center" style="margin-right: 170px;">
				<a href="<%=cp %>/movie/movie_evaluation_select.do" style="color: black; font-size: 14pt;"><b>영화</b></a>&nbsp;&nbsp;&nbsp;
				<a href="<%=cp %>/movie/movie_select.do" style="color: black; font-size: 14pt;"><b>예매</b></a>&nbsp;&nbsp;&nbsp;
				<a href="<%=cp %>/store/list.do" style="color: black; font-size: 14pt;"><b>스토어</b></a>
				<br><br>
				</div>
			</div>	
	</div>
</div>

<img src="<%=cp %>/jspProject/image/Gline.png">


<!-- 광고 -->
<div style="position: absolute;top:250px;left:1%">
<img alt="" src="<%=cp %>/jspProject/image/sideimg.BMP">
</div>


<!-- 실 내용 -->
<div align="center">
<%-- <img alt="" src="<%=cp %>/jspProject/image/movie1.jpg" height="600px" width="500px"> --%>

<div id="content" align="center">
	<div align="center">
		<br><br>
	</div>
	<div class="slideshow-container">
<br><br>
  <!-- Full-width images with number and caption text -->
 <%if(movietype.equals("보통의연애")){ %>
  <div class="mySlides fade">
    <img src="<%=cp %>/jspProject/image/movie1.jpg" style="width:60%">
    <!-- <div class="text">보통의연애</div> -->
  </div>
<%}else if(movietype.equals("장사리")){ %>
  <div class="mySlides fade">
    <img src="<%=cp %>/jspProject/image/movie2.jpg" style="width:60%">
    <!-- <div class="text">장사리</div> -->
  </div>

<%}else if(movietype.equals("퍼펙트맨")){ %>
  <div class="mySlides fade">
    <img src="<%=cp %>/jspProject/image/movie3.jpg" style="width:60%">
    <!-- <div class="text">퍼펙트맨</div> -->
  </div>
  
<%}else if(movietype.equals("양자물리학")){ %>
  <div class="mySlides fade">
    <img src="<%=cp %>/jspProject/image/movie4.jpg" style="width:60%">
    <!-- <div class="text">양자물리학</div> -->
  </div>
  
<%}else if(movietype.equals("조커")){ %>
  <div class="mySlides fade">
    <img src="<%=cp %>/jspProject/image/movie5.jpg" style="width:60%">
    <!-- <div class="text">조커</div> -->
  </div>
<%} %>
  <!-- Next and previous buttons -->
</div>


<br><br><br>

<form name="movie_form" method="post" action="<%=cp %>/movie/movie_evaluation_ok.do">
<%if(session.getAttribute("customInfo")!=null){ %>
<div style="height: 100px; width: 800px; display: inline ">
<%}else{ %>
<div style="height: 70px;width: 800px; display: none ">
<%} %>
<br>
별점
<select name="star_select">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10" selected="selected">10</option>
</select>
&nbsp;&nbsp;&nbsp;감상평  
<input type="text" name="content" style="width: 500px">
<input type="submit" value="작성하기">
</div>
</form>

<br>
<table width="900px">
<%for(Movie_AppraisalDTO dto:lists){ %>
<tr style="background-color: gray; height: 3px"><td colspan="2">
</tr>
<tr>
<td colspan="2">
<%
int k=0;
for(int i=0;i<dto.getStar_select()/2;i++){
k++;%>
<img alt="" src="<%=cp %>/jspProject/image/fullstar.png">
<%} 
if(dto.getStar_select()%2==1){
	k++;
%>
<img alt="" src="<%=cp %>/jspProject/image/halfstar.png">
<%} %>
<%
for(int i=0;k<5;k++){%>
<img alt="" src="<%=cp %>/jspProject/image/emptystar.png">
<%} %>&nbsp;&nbsp;&nbsp;


감상평 : <%=dto.getMsg() %></td></tr>
<td>작성자 : <%=dto.getUserId() %></td> <td align="right">작성날짜 : <%=dto.getWritedate() %></td>
		
</tr>			
<%} %>
<tr style="background-color: gray; height: 3px"><td colspan="2">
</table>
<%if(dataCount!=0){%>
				<%=pageIndexList%>
				<%}else{%>
				등록된 게시물이 없습니다.
			<%
			}
			%>
</div>

<!-- 하단 이미지 -->
<br><br><br><br>
</div>
<div class="floating">
	<img style="border: 3px solid red; border-radius: 7px;" src="<%=cp %>/jspProject/image/floating.png">
</div>
<div id="footer">
	<img src="<%=cp %>/jspProject/image/underimage.png">
</div>
</body>
</html>