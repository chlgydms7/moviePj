<%@page import="com.util.DBCPConn"%>
<%@page import="com.movie.Movie_PaymentDAO"%>
<%@page import="com.movie.Movie_PaymentDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
String cp =request.getContextPath();

List<Movie_PaymentDTO> lists=(List<Movie_PaymentDTO>)request.getAttribute("lists");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 그 이상의 감동. CGV</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<script type="text/javascript">
var result=0;
var set=1;
function select(str) {
	h="h"+str;
	if(result!=set){
		if(document.getElementById(h).value=="1"){
			 document.getElementById(str).style.backgroundColor="#98F791";
			 document.getElementById(h).value="2";
			 result++;
	 	}
		else if(document.getElementById(h).value=="2"){
			document.getElementById(str).style.backgroundColor="#444444";
			 document.getElementById(h).value="1";
			 result--;
		}else{
			alert("예약된 좌석입니다..");
		}
	}else{
		if(document.getElementById(h).value=="2"){
		document.getElementById(str).style.backgroundColor="#444444";
		 document.getElementById(h).value="1";
		 result--;
	}else{
		alert("더이상 지정할 수 없습니다.");
	}
	}
}
function resetevent(k) {
	for(i=0;i<=10;i++){
		for(j=1;j<=10;j++){
			h="h"+((i*10)+j);
			if(document.getElementById(h).value=="2"){
			document.getElementById(h).value="1";
			document.getElementById(((i*10)+j)).style.backgroundColor="#444444";
			}
		}
		set=k;
		result=0;
	}
}
function resultset() {
	if(result==set){
		var f=document.myForm;
		f.action="<%=cp%>/movie/sit_ok.do";
		alert("결제페이지로 넘어갑니다.");
		f.submit();
	}else{
		alert("인원수를 맞춰주세요.");
	}
	
	
}
</script>
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

.mySlides { display: none;}

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

<c:choose>
		<c:when test="${empty sessionScope.customInfo.userId }">
			<div class="login" style="margin-left:350px; width: 1000px; height: 20px;" align="right">
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
				<a href="<%=cp%>/cgv/cgvMain.jsp"><img style="padding-left: 20px;" src="<%=cp %>/jspProject/image/cgvLogo.png"></a>
				</h1>
			</div>
			<div style="display: inline-block; padding-left:70px; margin-top:10px; float: left; width: 80%" > 
				<h3 align="center" style="width: 550px; margin-left: 0; margin-right: 0;">
					<img src="<%=cp %>/jspProject/image/cultureplex.png">
				</h3>
				<div id="nav" align="center" style="margin-right: 210px;">
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
<img alt="" src="<%=cp%>/jspProject/image/sideimg.BMP">
</div>
<%-- <div style="position: absolute;top:250px;left:75%">
<img alt="" src="<%=cp%>/jspProject/image/sideimg.BMP">
</div> --%>

<!-- 실 내용 -->
<div align="center">
<br><br><br><br><br><br>
<div style="background-color: #333333; width: 30%; height: 70px"><br>
<font color="#ffffff" size="4"> 영화 좌석 예매</font>
</div>
<div style="border:1pt solid black; width: 30%; ">
<br>
<form action="<%=cp%>/movie/sit_ok.do" name="myForm" method="post">
<b>
<font style="font-style:inherit;">
영화명 : ${param.movietype }&nbsp;&nbsp;&nbsp; 영화 시간 : ${param.timetype } &nbsp;&nbsp;&nbsp;상영관 : ${param.roomtype }번
</font>
</b>
<br><br>
예매할 인원수 : &nbsp;&nbsp;&nbsp;
<input type="button" onclick="resetevent(1)" value="1">
<input type="button" onclick="resetevent(2)" value="2">
<input type="button" onclick="resetevent(3)" value="3">
<input type="button" onclick="resetevent(4)" value="4">
<input type="button" onclick="resetevent(5)" value="5">
&nbsp;&nbsp;
<input type="button" onclick="resultset()" value="결제페이지로">
<input type="hidden" name="movietype" value="${param.movietype }">
<input type="hidden" name="timetype" value="${param.timetype }">
<input type="hidden" name="roomtype" value="${param.roomtype }">
<br><br>
<span style="height: 10px;width: 10px;background-color: #444444"><font color="#444444">ㅁ</font> </span>예매가능
<span style="height: 10px;width: 10px;background-color: #98F791"><font color="#98F791">ㅁ</font> </span>선택한 좌석
<span style="height: 10px;width: 10px;background-color: #FF6C6C"><font color="#FF6C6C">ㅁ</font> </span>예매 불가능
<br><br>
</div>
<br><br>
<div style="background-color: gray; width: 20%; height: 20px">
screen
</div>
<br><br>
<table>
<%
	for(int i=0;i<10;i++){
%>
<tr>
<%
	for(int j=1;j<=10;j++){
	boolean result=true;
for(Movie_PaymentDTO dto:lists){
	if(dto.getSitnum()==((i*10)+j)){
		result=false;
	}
}
if(result){
%>
<td align="center" width="30px" height="30px" bgcolor="#444444" id="<%=((i*10)+j) %>" onclick="select(this.id)"><%=((i*10)+j) %><input type="hidden" name="h<%=((i*10)+j) %>" id="h<%=((i*10)+j) %>" value="1"> </td>
<%}else{%>
<td align="center" width="30px" height="30px" bgcolor="#FF6C6C" id="<%=((i*10)+j) %>" onclick="select(this.id)"><%=((i*10)+j) %><input type="hidden" name="h<%=((i*10)+j) %>" id="h<%=((i*10)+j) %>" value="3"> </td>
<% }
if(j==3||j==7){ %>
<td align="center" width="30px" height="30px" bgcolor="#FEF8DC"></td>
<%} %>
<%} %>
</tr>
<%} %>
</table>
<br>

</form>

<!-- 하단 이미지 -->
<br><br><br><br>
</div>
<div class="floating">
	<img style="border: 3px solid red; border-radius: 7px;" src="<%=cp %>/jspProject/image/floating.png">
</div>
<div id="footer">
	<img src="<%=cp %>/jspProject/image/underimage.png">
</div>
</div>
</body>
</html>