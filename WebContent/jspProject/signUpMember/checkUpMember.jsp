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
<title>CGV+CJ ONE 통합회원 가입</title>

<link href="<%=cp%>/jspProject/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=cp%>/jspProject/css/style.css" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<script type="text/javascript" src="<%=cp %>/jspProject/js/util.js"></script>

<script type="text/javascript">
	function sendIt(){
		
		var f = document.myForm;
		
		str = f.userName.value;
		str = str.trim();
		if(!str){
			alert("이름를 입력하세요!");
			f.userName.focus();
			return;
		}
		f.userName.value = str;
			
	
		str = f.userBirth.value;
		str = str.trim();
		if(!str){
			alert("생일을 입력하세요!");
			f.userBirth.focus();
			return;
		}
		f.userBirth.value = str;
		
		str = f.userTel.value;
		str = str.trim();
		if(!str){
			alert("전화번호를 입력하세요!");
			f.userTel.focus();
			return;
		}
		f.userTel.value = str;
		
		f.action = "<%=cp%>/movie/signConfirm_ok.do";
		f.submit();
		
	}
</script>

<style type="text/css">
/* 기본 css */
a:link { text-decoration: none;}
a:hover { text-decoration: none;}
.book {
	font-size: 18px;
	font-weight: bold;
}
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
</style>

</head>
<body style="background-color: #FFFFFF;">

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
				<a class="book" href="<%=cp %>/store/list.do" style="color: #222222;"><b>스토어</b></a>
				<br><br>
				</div>
			</div>	
	</div>
</div>
<img src="<%=cp%>/jspProject/image/Gline.png">
<br><br>


<img width="100%" src="<%=cp %>/jspProject/image/signUpMemberbanner.jpg" >

<br/><br/><br/><br/><br/>

<form action="" method="post" name="myForm">
<div align="center">
<table align="center" >
	<tr>
		<td align="center">
			<font face="verdana" size="6" ><b>CGV+CJ ONE 통합회원 가입</b></font><br/><br/>
			<font face="verdana" size="4" ><b>통합 아이디로 CJ ONE 브랜드 혜택도 받고! 포인트도 쌓고!</b></font><br/>
		</td>
	</tr>
	<tr height="15px"></tr>
</table>

<table width="1020px" border="0" cellpadding="0" cellspacing="0" align="center" bgcolor="#F8F8F8">
	<tr height="2px">
		<td colspan="4" width="820px" bgcolor=#898987></td>
	</tr> 
	<tr height="2px" valign="top">
		<td colspan="2" width="440px"></td>
		<td rowspan="9"  width="31px"></td>
		<td rowspan="9" width="549px"><img alt="Event Banner" src="<%=cp %>/jspProject/image/signUpMessage.jpg" width="549" height="273"></td>
	</tr>
	<tr height="45px" valign="middle">
		<td colspan="2" width="440px" align="left">

		</td>
	</tr>

	<tr height="30px">
		<td colspan="2" align="left"><input type="text" name="userName" placeholder="이름을 입력하세요" style="text-align:left; width:240px; height:42px; letter-spacing: 1px" /></td>
	</tr>
	<tr height="30px">
		<td colspan="2" align="left">
		<input type="text" name="userBirth" placeholder="법정생년월일 8자리를 입력해주세요." style="text-align:left; width:240px; height:42px; letter-spacing: 1px" />
		<font face="verdana" size="2" >[YYYYMMDD]</font>
		</td>
	</tr>
	<tr height="30px">
		<td colspan="2" align="left">
		<input type="password" name="userTel" placeholder="전화번호를 입력하세요" style="text-align:left; width:240px; height:42px; letter-spacing: 1px"/>
		<font face="verdana" size="2" >['-'을 제외하고 입력하세요]</font>
		</td>
	</tr>
	<tr height="30px">
		<td colspan="2" align="left">
		<input type="button" value="가입여부 확인" style="text-align:center; width:244px; height:42px; letter-spacing: 5px" onclick="sendIt();" />
		</td>
	</tr>

	<tr valign="middle">
	</tr>
	<tr height="40px">
		<td colspan="2" width="440px"></td>
	</tr>
	<tr height="2px">
		<td colspan="2" width="440px"></td>
	</tr>
	<tr height="2px">
		<td colspan="4" width="820px" bgcolor=#898987></td>
	</tr> 
	<tr height="30px">
		<td colspan="4" bgcolor="#ffffff"></td>
	</tr>
	<tr>
		<td colspan="4">
			<img src="<%=cp %>/jspProject/image/signUpbottombanner.jpg" width="1020"/>
		</td>
	</tr>
</table>
</div>
<div id="footer">
	<img src="<%=cp%>/jspProject/image/underimage.png">
</div>

</form>

</body>
</html>


<%-- 
<font size="7"> CGV+CJ ONE 통합회원 가입</font><br/>
<font size="3"> 통합 아이디로 CJ ONE 브랜드 혜택도 받고! 포인트도 쌓고!</font><br/>
<form action="" method="post" name="myForm">
	<input type="text" name="userName" placeholder="이름을 입력해주세요" size="30"/><br/>
	<input type="text" name="userBirth" placeholder="법정생년월일 6자리를 입력해주세요." size="30"/>[YYYYMMDD]<br/>
	<input type="text" name="userTel" placeholder="휴대전화번호를 입력해주세요." size="30"/>['-'를 제외하고 입력하세요]<br/>
<input type="button" value="가입여부 확인" onclick="sendIt();"/>
<input type="button" value="회원가입" onclick="javascript:location.href='<%=cp%>/movie/signUp.do';"/>
<input type="button" value="로그인" onclick="javascript:location.href='<%=cp%>/movie/login.do';"/>
</form>
<br/>${message }
</body>
</html> --%>