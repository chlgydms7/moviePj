<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제완료</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<style type="text/css">

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
	/*파이팅~~~~~ head 문제 같음ㅋㅋㅋ*/
	width: 1370px;
	height: 130px; 
	padding-left: 550px;
	margin-left: 0px;
	margin-right: 0px; 
}

.login{
	
	font-size: 9pt;

}
#test_btn1{
border-radius: 5px;
border: 1px solid #5a5a5a;
background-color: rgb(242,240,229);
color: #5a5a5a;
padding: 5px;
}

.floating{
position: fixed;
right: 50%;
top: 180px;
margin-right: -720px;
text-align: center;
width: 180px;

}

.btn2{
border: 1px;

}

</style>

</head>
<body leftmargin="0" rightmargin="0" bgcolor="#FDFCF0">

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

<img src="<%=cp %>/jspProject/image/Gline.png">
<div class="head" style="background-color: #FEF8DC; margin-right: 0px;">
	<div>
			<div style="display: inline-block; float: left; width: 20%" >
				<h1 align="left" >
				<a href="<%=cp%>/movies/cgvMain.do"><img style="padding-left: 20px;" src="<%=cp %>/jspProject/image/cgvLogo.png"></a>
				</h1>
			</div>
			<div style="display: inline-block; margin-top:10px; float: left; width: 80%" > 
				<h3 align="left" style="width: 550px; margin-left: 50px; margin-right: 0;">
					<img src="<%=cp %>/jspProject/data/image/ticket.png">
				</h3>
				<div id="nav" align="left" style="margin-right: 350px;">
				<a class="book" href="<%=cp %>/movie/movie_evaluation_select.do" style="color: #222222; font-size: 14pt;"><b>영화정보</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="book" href="<%=cp %>/movie/movie_select.do" style="color: #222222; font-size: 14pt;"><b>예매</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="book" href="<%=cp %>/store/list.do" style="color: #222222; font-size: 14pt;"><b>스토어</b></a>
				<br><br>
				</div>
			</div>	
	</div>
</div>
<img src="<%=cp %>/jspProject/image/Gline.png">
<br/><br/><br/><br/>

<table width="800" align="center" cellpadding="0" cellspacing="0" style="background-color: rgb(242,240,229);">

<tr style="background-color: rgb(51,51,51); color: white;" height="40" >
	<td align="left"><b>&nbsp;&nbsp;결제내역</b></td>
</tr>

<tr height="3">
	<td colspan="2" bgcolor="#fef8dc"></td>
</tr>

<tr style="color: rgb(51,51,51); background-color: rgb(223,222,214)" height="50">
	<td align="center">
		<b>&nbsp;&nbsp;결제가 완료되었습니다.</b>
	</td>
</tr>

<tr height="40">
		<td style="background-color: rgb(249,248,243); color: rgb(102,102,102); text-align: center; font-size: 10pt; font-family: 고딕체; border: 1px solid; border-color: rgb(223,222,214);" align="center" colspan="2" width="800" height="30">
			<b>예매번호로만 티켓을 찾을 수 있습니다.</b>
		</td>
</tr>

</table>

<table width="600" align="center" cellpadding="0" cellspacing="0" style="background-color: rgb(242,240,229); border: 3px solid; border-color: rgb(51,51,51);">

	<tr height="50">
		<td align="right" width="100" style="font-size: 10pt; color: rgb(102,102,102);">예매번호</td>
		<td align="left" width="400" style="font-size: 12pt; color: rgb(51,51,51);"><b>&nbsp;&nbsp;&nbsp;&nbsp;${reserveNum }</b></td>
	</tr>
	
	<tr height="50">
		<td align="right" width="100" style="font-size: 10pt; color: rgb(102,102,102);">결제방법</td>
		<td align="left" width="400" style="font-size: 12pt; color: rgb(51,51,51);"><b>&nbsp;&nbsp;&nbsp;&nbsp;카드결제(${payMethod })</b></td>
	</tr><br/>
	
	<tr height="50">
		<td align="right" width="100" style="font-size: 10pt; color: rgb(102,102,102);">영화명</td>
		<td align="left" width="400" style="font-size: 12pt; color: rgb(51,51,51);"><b>&nbsp;&nbsp;&nbsp;&nbsp;${movietype }</b></td>
	</tr>
	
	<tr height="50">
		<td align="right" width="100" style="font-size: 10pt; color: rgb(102,102,102);">관람일시</td>
		<td align="left" width="400" style="font-size: 12pt; color: rgb(51,51,51);"><b>&nbsp;&nbsp;&nbsp;&nbsp;${timetype }</b></td>
	</tr>
	
	<tr height="50">
		<td align="right" width="100" style="font-size: 10pt; color: rgb(102,102,102);">관람인원</td>
		<td align="left" width="400" style="font-size: 12pt; color: rgb(51,51,51);"><b>&nbsp;&nbsp;&nbsp;&nbsp;${member }</b></td>
	</tr>
	
	<tr height="50">
		<td align="right" width="100" style="font-size: 10pt; color: rgb(102,102,102);">좌석</td>
		<td align="left" width="400" style="font-size: 12pt; color: rgb(51,51,51);"><b>&nbsp;&nbsp;&nbsp;&nbsp;${sitnum }</b></td>
	</tr>
	
	<tr height="70">
		<td align="center" colspan="2" style="text-align: center; font-size: 10pt; color: rgb(51,51,51);">
			입장 지연에 따른 관람 불편을 최소화하기 위해<br/>
			본 영화는 10분 후 상영이 시작됩니다.
		</td>
	</tr>
	
	<tr height="70" align="right">
		<td style="font-size: 10pt; color: rgb(51,51,51);">총 금액</td>
		<td style="font-size: 12pt; color: rgb(51,51,51);"><b>${cost }&nbsp;원&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
	</tr>

</table>

<table width="600" align="center" cellpadding="0" cellspacing="0">
	
	<tr><td height="30"></td></tr>
	
	<tr>
		<td colspan="2" align="right"><a href="/movieproject/movie/main.do"><img alt="" src="<%=cp%>/jspProject/data/image/ok.png"></a></td>
	</tr>
	
	<tr><td height="30"></td></tr>

</table>

<img alt="" src="<%=cp%>/movie/data/underimage.png">

</body>
</html>