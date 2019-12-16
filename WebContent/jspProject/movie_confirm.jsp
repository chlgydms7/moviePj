<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>확인 화면</title>

<link href="<%=cp%>/jspProject/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=cp%>/jspProject/css/style.css" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">

<style type="text/css">
/* 기본 css */
a:link { text-decoration: none;}
a:hover { text-decoration: none;}

.book {

	font-size: 18px;
	font-weight: bold;
}

body {
	
	font-family: "Nanum Gothic", sans-serif;
	
	}

.nav {

	text-align: center;
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

</style>

</head>
<body bgcolor="#FFFFFF">

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

	
<img src="<%=cp%>/jspProject/image/Gline.png">
<div class="head" style="background-color: #FEF8DC; margin-right: 0px;">
	<div>
			<div style="display: inline-block; float: left; width: 20%; padding-top: 20px;" >
				<h1 align="left" >
				<a href="<%=cp%>/movie/main.do"><img style="padding-left: 20px;" src="<%=cp%>/jspProject/image/cgvLogo.png"></a>
				</h1>
			</div>
			<div style="display: inline-block; margin-top:10px; float: left; width: 80%; padding-left:30px; padding-top: 20px;" > 
				<h3 align="center" style="width: 550px; margin-left: 0; margin-right: 0;">
					<img  src="<%=cp%>/jspProject/image/cultureplex.png">
				</h3>
				<div id="nav" align="center" style="margin-right: 250px;">
				<a class="book" href="<%=cp %>/movie/movie_evaluation_select.do" style="color: #222222;"><b>영화정보</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="book" href="<%=cp %>/movie/movie_select.do" style="color: #222222;"><b>예매</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="book" href="<%=cp %>/movie/list.do" style="color: #222222;"><b>스토어</b></a>
				<br><br>
				</div>
			</div>	
	</div>
</div>
<img src="<%=cp%>/jspProject/image/Gline.png">
<br><br>


<br/><br/><br/><br/>

<div align="center">
<table align="center" >
	<tr>
		<td align="center">
			<font face="verdana" size="7" ><b>${message1 } 확인</b></font><br/><br/>
			<font face="verdana" size="3" ><b>입력하신 정보와 일치하는 ${message1 }는 다음과 같습니다.</b></font><br/>
		</td>
	</tr>
	<tr height="15px"></tr>
</table>


<table width="800" align="center" border="0" cellpadding="0" cellspacing="0">
	<tr height="80">
		<td align="center" width="150"><font face="verdana" size="6" style="letter-spacing: 3px" color="#E98D44"><b>${message2 }</b></font></td>
	</tr>
	<tr height="20">
	</tr>
	<tr>
		<td align="center">
			<input type="button" value="${message3 }" style="text-align:center; width:244px; height:42px; letter-spacing: 5px" onclick="javascript:location.href='<%=cp%>/movie/${message4 }"/>
			<input type="button" value="${message5 }" style="text-align:center; width:244px; height:42px; letter-spacing: 5px" onclick="javascript:location.href='<%=cp%>/movie/${message6 }"/>
		</td>
	</tr>
	<tr height="40">
	</tr>
	<tr>
		<td>
			<img src="<%=cp %>/jspProject/image/findIdbase.jpg" width="1020"/>
		</td>
	</tr>
</table>
</div>

<br/><br/><br/><br/>	

<div id="footer">
	<img src="<%=cp%>/jspProject/image/underimage.png">
</div>
</body>
</html>