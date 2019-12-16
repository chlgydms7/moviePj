<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");	
	String cp = request.getContextPath();
	int count = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>영화 그 이상의 감동. CGV</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
  <!-- Bootstrap core CSS -->
  <link href="<%=cp%>/mvproject/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript -->
  <script src="<%=cp%>/mvproject/vendor/jquery/jquery.min.js"></script>
  <script	src="<%=cp%>/mvproject/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Plugin JavaScript -->
  <script src="<%=cp%>/mvproject/vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/scrolling-nav.css" rel="stylesheet">
  <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
  <script type="text/javascript" async="" src="https://www.google-analytics.com/plugins/ua/ec.js"></script>
  
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

.floating{
position: fixed;
right: 50%;
top: 200px;
margin-right: -660px;
text-align: center;
width: 180px;

}
</style>
<script type="text/javascript">
	function paymentSendIt() {
		var f = document.myForm;
		f.action = "<%=cp%>/store/bill.do";
		alert("결제를 진행할까요 ?");
		f.submit();
	}
	function CheckAll(chk) {
		for (i = 0; i < chk.length; i++) {
			if (chk[i].checked == true) {
				chk[i].checked = false;
			} else {
				chk[i].checked = true;
			}
		}
	}
</script>
</head>

<body id="page-top" style="background-color: #FDFCF0;">
<!-- 로그인시 로그아웃, mycgv나오게 디폴트 로그인 회원가입 mycgv -->

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


  <!-- Navigation -->
<img src="<%=cp%>/jspProject/image/Gline.png">
<div class="head" style="background-color:#FEF8DC; margin-right: 0px;">
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

  <br/><br/>
	<div class="container" align="left">
	 	 <section id="about">
		      <div class="row">
		        <div class="col-lg-8 mx-auto" >
		          <h3 style="margin-left: -50px;"><b>영화 예매 정보</b></h3> 
		      	</div>
	      	</div>
	  </section>
	 </div> 
	  <br/>
	  <div class="container">
	<div class="container" style="padding-left: 150px">
			<table style="width: 800px;" border="0">
				<tr><td style="font-size: 20px;"><b>My 예매 내역</b></td></tr>
				<tr><td style="height: 20px;"></td></tr>
				<tr height="3"><td colspan="7" bgcolor="black" ></td></tr>
					<tr height="50">
						<td align="center" width="20">영화명</td>
						<td align="center" width="80">상영시간</td>
						<td align="center" width="30">상영관</td>
						<td align="center" width="30">결제방식</td>
						<td align="center" width="30">좌석번호</td>
						<td align="center" width="30">예약번호</td>
					</tr>		
					<td colspan="7" bgcolor="#cccccc"></td>
				</tr>
				<c:forEach var="dto" items="${paylist}">	
					<tr height="30">
						<td align="center" width="80">${dto.movietype}</td>
						<td align="center" width="80">${dto.timetype}</td>
						<td align="center" width="60">${dto.roomtype }</td>
						<td align="center" width="60">${dto.payMethod }</td>
						<td align="center" width="60">${dto.sitnum }</td>
						<td align="center" width="60">${dto.reserveNum }</td>
					</tr>
				</c:forEach>	
				<tr height="1"><td colspan="7" bgcolor="black"></td></tr>
			</table >
			<br/><br/>
			<table style="width: 800px;">
				<tr>
					<td style="font-size: 20px;" colspan="4"><b>주문자 정보 확인</b></td>
				</tr>
				<tr><td style="height: 20px;"></td></tr>
				<tr height="3">
					<td colspan="4" bgcolor="black"></td>
				</tr>
				<tr height="70">
					<td align="left" width="100" ><b>이름</b></td>
					<td style="padding-left: 5px; " width="150">
						<input type="text" name="name" size="10" maxlength="10" class="txtField" value="${ticketdto.userName }" style="border:none; background-color: #FDFCF0;">
					</td>	
				</tr>
				<tr height="100">
					<td align="left" width="100" ><b>전화번호</b></td>
					<td style="padding-left: 5px; " width="150">
						<input type="text" name="name" size="10" maxlength="10" class="txtField" value="${ticketdto.userTel }" style="border:none; background-color: #FDFCF0;">
					</td>
				</tr>
				<tr height="70">
					<td align="left" width="100" ><b>이메일</b></td>
					<td style="padding-left: 5px; " width="150">
						<input type="text" name="name" size="20" maxlength="20" class="txtField" value="${ticketdto.userEmail }" style="border:none; background-color: #FDFCF0;">
					</td>
				</tr>
				<tr height="1">
					<td colspan="4" bgcolor="#cccccc"></td>
				</tr>
				<tr><td colspan="4" style="font-size: 15px;"></td></tr>
			</table>
			<br/><br/>
			<h1 style="text-align: center;padding-right: 100px">즐거운 관람 되세요</h1>
		</div>
	  </div>
	  </div>	
 
  <!-- Bootstrap core JavaScript -->
  <script src="<%=cp%>/mvproject/jquery/jquery.min.js"></script>
  <script src="<%=cp%>/mvproject/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Plugin JavaScript -->
  <script src="<%=cp%>/mvproject/vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom JavaScript for this theme -->
  <script src="<%=cp%>/mvproject/js/scrolling-nav.js"></script>
  <br><br><br><br>
<!-- 이벤트 이미지 처리 -->

<div id="footer">
	<img src="<%=cp%>/jspProject/image/underimage.png">
</div>
</body>

</html>