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
<script type="text/javascript">
/* background-position-x:10px */
var x=10;
var y=10;
 function backimg() {
playAlert = setInterval(function() {
	document.getElementById("mainbody").style.backgroundPositionX=x+'px';
	document.getElementById("mainbody").style.backgroundPositionY=y+'px';
	/*  document.getElementById(mainbody).style.background-position-y='10px';  */
	x++;
	y++;
	}, 100);
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
<%-- <body id="mainbody" name="mainbody" style="background-color: #FEF8DC;background-image:url('<%=cp%>/jspProject/image/pop.jpg'); " onload="backimg()"> --%>
<body style="background-color: #FDFCF0;">
<div class="login" style="margin-left:350px; width: 1000px; height: 20px;" align="right">
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
			<a href="<%=cp%>/movie/main.do"><img style="padding-left: 60px;" src="<%=cp %>/jspProject/image/cgvLogo.png"></a>
			</h1>
		</div>
		<div style="display: inline-block; margin-top:10px; float: left; width: 80%" > 
			<h3 align="center" style="width: 550px; margin-left: 70px; margin-right: 0;">
				<img src="<%=cp %>/jspProject/image/cultureplex.png">
			</h3>
			<div id="nav" align="center" style="margin-right: 140px;">
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
<%-- <div style="position: absolute;top:250px;left:75%">
<img alt="" src="<%=cp %>/jspProject/image/sideimg.BMP">
</div> --%>

<!-- 실 내용 -->
<div align="center">
<br><br><br><br><br><br><br>
<div style="width: 40%;border-bottom:3pt solid #444444; " align="left" ><font size="13pt"><b>무비 평점</b></font></div>
<br><br><br>
<table cellpadding="10px">
<tr>
<td style="border:3pt solid #979696;width: 200px" align="center">
<a href="movie_evaluation.do?movietype=보통의연애">
<img alt="" src="<%=cp %>/jspProject/image/movie1.jpg" style="width: 250px;height: 200px"><br>
보통의연애
</a>
</td>
<td style="border:3pt solid #979696;width: 200px" align="center">
<a href="movie_evaluation.do?movietype=장사리">
<img alt="" src="<%=cp %>/jspProject/image/movie2.jpg" style="width: 250px;height: 200px"><br>
장사리
</td>
<td style="border:3pt solid #979696;width: 200px" align="center">
<a href="movie_evaluation.do?movietype=퍼펙트맨">
<img alt="" src="<%=cp %>/jspProject/image/movie3.jpg" style="width: 250px;height: 200px"><br>
퍼펙트맨
</td>
</tr>
<tr>
<td style="border:3pt solid #979696;width: 200px" align="center">
<a href="movie_evaluation.do?movietype=양자물리학">
<img alt="" src="<%=cp %>/jspProject/image/movie4.jpg" style="width: 250px;height: 200px"><br>
양자물리학
</td>
<td style="border:3pt solid #979696;width: 200px" align="center">
<a href="movie_evaluation.do?movietype=조커">
<img alt="" src="<%=cp %>/jspProject/image/movie5.jpg" style="width: 250px;height: 200px"><br>
조커
</td>
<td>
</td>
</tr>
</table>

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