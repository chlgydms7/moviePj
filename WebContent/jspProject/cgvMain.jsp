
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
<title>영화 그 이상의 감동. CGV</title>

<link href="<%=cp%>/jspProject/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="<%=cp%>/jspProject/vendor/jquery/jquery.min.js"></script>
<script	src="<%=cp%>/jspProject/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Plugin JavaScript -->
<script src="<%=cp%>/jspProject/vendor/jquery-easing/jquery.easing.min.js"></script>

<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async="" src="https://www.google-analytics.com/plugins/ua/ec.js"></script>
<script type="text/javascript">


	function movieselect() {
		 alert("로그인이 필요합니다");
	} 
</script>
<style type="text/css">

/* 기본 css */
a:link { text-decoration: none;}
a:hover { text-decoration: none;}

body {
	
	font-family: "Nanum Gothic", sans-serif;
	
	}

.book {

	font-size: 18px;
	font-weight: bold;
}

.nav {

	text-align: center;
}

#content {
	
	width: 1000px;
	height: 1500px;
	margin-left: 400px;
	margin-right: 500px;
	
	background-image: url("./image/bg_c_bricks.png");
	
}

#header { 
	
	
 	width: 1000px;
	height: 130px; 
	padding-left: 300px;
	padding-right: 300px; 

}

#container{

	background-repeat: repeat-x;
	background-position: 0px 70px;

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
</head>
<body style="background-color: #FDFCF0;">

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
			<a class="book" href="<%=cp %>/movie/movie_evaluation_select.do" style="color: #222222;"><b>영화</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:choose>
				<c:when test="${empty sessionScope.customInfo.userId }">
					<a class="book" href="<%=cp %>/movie/movie_select.do" style="color: #222222;" onclick="movieselect();"><b>예매</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:when>
				<c:otherwise>
					<a class="book" href="<%=cp %>/movie/movie_select.do" style="color: #222222;"><b>예매</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>
			<a class="book" href="<%=cp %>/store/list.do" style="color: #222222;"><b>스토어</b></a>
			<br><br>
			</div>
		</div>	
	</div>
</div>
<img src="<%=cp%>/jspProject/image/Gline.png">
<br><br>

<!-- 내용부분 -->
<div id="container" align="center" style="background-image: url('<%=cp%>/jspProject/image/bg_c_bricks.png');">
<div id="content" align="center">
	<img style="padding-bottom: 30px;" src="<%=cp%>/jspProject/image/movie_selection.gif"/>
	<div id="carousel1" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carousel1" data-slide-to="0" class="active"></li>
			<li data-target="#carousel1" data-slide-to="1"></li>
			<li data-target="#carousel1" data-slide-to="2"></li>
			<li data-target="#carousel1" data-slide-to="3"></li>
			<li data-target="#carousel1" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
			
			<a href="<%=cp%>/movie/movie_select.do" style="width: 135px;height: 135px;cursor:pointer;position: absolute;left: 255px;top: 255px;" onclick="javascript:adi_lottecinema_20190910_1_fn_MoviePlay(2)" 
			title="가장 보통의 연애 예매하러 가기!" data-id="14805" data-name="가장 보통의 연애"></a>
				<img class="d-block w-100"
					src="<%=cp %>/jspProject/image/movie1.jpg"
					alt="First slide">

			</div>
			<div class="carousel-item">
			
			<a href="<%=cp %>/movie/movie_select.do" style="width: 135px;height: 135px;cursor:pointer;position: absolute;left: 255px;top: 255px;" onclick="javascript:adi_lottecinema_20190924_33_fn_MoviePlay(2)" 
			title="역사를 뒤바꾼 기록, 잊혀진 772명의 기록! 장사리 잊혀진 영웅들 예매하러 가기!" data-id="14789" data-name="장사리  잊혀진 영웅들"></a>
				<img class="d-block w-100"
					src="<%=cp %>/jspProject/image/movie2.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<a href="<%=cp %>/movie/movie_select.do"" style="width: 135px;height: 135px;cursor:pointer;position: absolute;left: 255px;top: 255px;" 
				onclick="javascript:adi_lottecinema_20190911_1_fn_MoviePlay(2)" title="단짠단짠 코미디 퍼펙트맨 예매하러 가기!" data-id="14831" data-name="퍼펙트맨"></a>
				<img class="d-block w-100"
					src="<%=cp %>/jspProject/image/movie3.jpg"
					alt="Third slide">
			</div>
			<div class="carousel-item">
			<a href="<%=cp %>/movie/movie_select.do" style="width: 135px;height: 135px;cursor:pointer;position: absolute;left: 255px;top: 255px;" onclick="javascript:adi_lottecinema_20190909_22_fn_MoviePlay(2)" 
			title="한국사회 부정부패 향한 통쾌한 핵사이다! 헤럴드팝 나쁜놈 잡는 법칙 양자물리학 예매하러 가기!" data-id="14718" data-name="양자물리학"></a>
				<img class="d-block w-100"
					src="<%=cp %>/jspProject/image/movie4.jpg"
					alt="Fourth slide">
			</div>
			<div class="carousel-item">
				<a href="<%=cp %>/movie/movie_select.do"style="width: 135px;height: 135px;cursor:pointer;position: absolute;left: 255px;top: 255px;" onclick="javascript:adi_lottecinema_20190910_98_fn_MoviePlay(2)" 
				title="상상 그 이상의 전율 베니스 영화제 황금사자상 호아킨 피닉스 토드 필립스 감독 작품 조커 예매하러 가기!" data-id="14879" data-name="조커"></a>
			
				<img class="d-block w-100"
					src="<%=cp %>/jspProject/image/movie5.jpg"
					alt="Fifth slide">
			</div>
		</div>
	</div>
<br><br><br><br>
<!-- 이벤트 이미지 처리 -->
<div>
	<img src="<%=cp%>/jspProject/image/eventPage.png">
</div>
</div>
</div>

<div class="floating">
	<img style="border: 3px solid red; border-radius: 7px;" src="<%=cp%>/jspProject/image/floating.png">
</div>
<div id="footer">
	<img src="<%=cp%>/jspProject/image/underimage.png">
</div>
</body>
</html>