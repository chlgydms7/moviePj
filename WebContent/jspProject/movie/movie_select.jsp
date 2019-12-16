<%@page import="com.movie.Movie_countDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.movie.Movie_selectDAO"%>
<%@page import="com.movie.Movie_selectDTO"%>
<%request.setCharacterEncoding("UTF-8");
String cp =request.getContextPath();
List<Movie_selectDTO> lists=(List<Movie_selectDTO>)request.getAttribute("lists");
List<Movie_countDTO> listscount=(List<Movie_countDTO>)request.getAttribute("listscount");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 그 이상의 감동. CGV</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<script type="text/javascript">
function movieimg(str) {
	if(str=='보통의 연애'){
		document.getElementById('imagesrc').src="<%=cp %>/jspProject/image/movie1.jpg";
	}
	if(str=='양자물리학'){
		document.getElementById('imagesrc').src="<%=cp %>/jspProject/image/movie4.jpg";
	}
	if(str=='퍼펙트맨'){
		document.getElementById('imagesrc').src="<%=cp %>/jspProject/image/movie3.jpg";
	}
	if(str=='조커'){
		document.getElementById('imagesrc').src="<%=cp %>/jspProject/image/movie5.jpg";
	}
	if(str=='장사리'){
		document.getElementById('imagesrc').src="<%=cp %>/jspProject/image/movie2.jpg";
	}
}
function movietype() {
	var k=document.getElementsByName('movietype');
	for(var i=0; i<k.length; i++) {
		document.getElementById(k[i].value).style.display="none";
		if(k[i].checked)
			{
				document.getElementById(k[i].value).style.display="inline";
				//display:inline
			}
	}
}
function timetype1(str){
	var k=document.getElementsByName('timetype');
	for(var i=0; i<k.length; i++) {
		if(k[i].checked)
			{
				document.getElementsByName('roomtype').value=str; 
				 document.getElementById("roomtype").value=str;
			}
	}
}
	/*  alert(document.getElementsByName('roomtype').value); 
	 alert(document.getElementById("roomtype").value); */
function myformsubmit() {
	document.myForm.submit();
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
<body style="background-color: #FDFCF0;">


<div class="login" style=" width: 1000px; height: 20px;" align="right">
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
				<a href="<%=cp%>/movie/main.do"><img style="padding-left: 20px;" src="<%=cp %>/jspProject/image/cgvLogo.png"></a>
				</h1>
			</div>
			<div style="display: inline-block; padding-left:70px; margin-top:10px; float: left; width: 80%" > 
				<h3 align="center" style="width: 550px; margin-left: 0; margin-right: 0;">
					<img src="<%=cp %>/jspProject/image/cultureplex.png">
				</h3>
				<div id="nav" align="center" style="margin-right: 210px;">
				<a href="<%=cp %>/movie/movie_evaluation_select.do" style="color: black; font-size: 14pt;"><b>영화</b></a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=cp %>/movie/movie_select.do" style="color: black; font-size: 14pt;"><b>예매</b></a>&nbsp;&nbsp;&nbsp;&nbsp;
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
<br>
<br>
<br>
<div align="center">
<img alt="" src="<%=cp %>/jspProject/image/movie3.jpg" width="900" height="600" id="imagesrc" name="imagesrc">
<br><br>
<form method="post" name="myForm" action="<%=cp%>/movie/sit.do">
<table style="border:1pt solid black">
<tr >
	<td align="center" colspan="2" style="background-color: #4C4C4C;border:1pt solid black">
	<font color="#D5D5D5">
		영화 선택</font>
	</td>
	<td align="center" colspan="2" style="background-color: #4C4C4C;border:1pt solid black">
	<font color="#D5D5D5">
		상영 시간 선택
		</font>
	</td>
</tr>
<tr>
	<td width="300px">
	<br>
	<%String movename="";
	for(Movie_selectDTO dto:lists){ 
	if(!dto.getMovietype().equals(movename)){
	movename=dto.getMovietype();%>
	<input type="radio" id="movietype" name="movietype" value="<%=dto.getMovietype()%>" onclick="movieimg('<%=dto.getMovietype()%>');" checked="checked"><b><%=dto.getMovietype()%></b><br><br>
	<%}
	} %>
	</td>
	<td width="50px" onclick="movietype()">
	<img alt="" src="<%=cp%>/jspProject/image/select.png" style="width: 50px">
	</td>
	<td width="300px">
	<%
	movename="";
	int timeboolean=0;
	for(Movie_selectDTO dto:lists){ 
	if(!dto.getMovietype().equals(movename)){
	movename=dto.getMovietype();
	%>
	<div style="display: none" id="<%=dto.getMovietype()%>">
	<% }
	timeboolean++;%>
	<input type="radio" id="timetype" name="timetype" value="<%=dto.getTimetype()%>" onclick="timetype1(<%=dto.getRoomtype()%>);"><%=dto.getTimetype()%> <%=dto.getRoomtype()%>번 상영관<br><br>
	
	<%
	int fullcount=0;
	for(Movie_countDTO dtos:listscount){
		if(dtos.getMovietype().equals(dto.getMovietype())){
			fullcount=dtos.getCount();
		}
	}
	if(timeboolean==fullcount){
		timeboolean=0;%>
	</div>
	<%}
	} %>
	</td>
	<td  width="50px">
	<input type="hidden" id="roomtype" name="roomtype" value="" >
	<img alt="" src="<%=cp%>/jspProject/image/select.png" style="width: 50px"  onclick="myformsubmit();" >
	<!-- <input type="submit" value=">" > -->
	</td>
	<%-- <td>
	<%
	for(Movie_selectDTO dto:lists){ 
	%>
	<div style="display: none" id="<%=dto.getMovietype()%><%=dto.getRoomtype()%>">
	<input type="radio" id="roomtype" name="roomtype" value="<%=dto.getRoomtype()%>"><%=dto.getRoomtype()%><br>
	</div>
	<%
	} %>
	</td> --%>
	
</tr>
</table>
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