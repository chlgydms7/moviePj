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

<body id="page-top" >
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

<div align="center" style="height: 400px;">
	<img src="<%=cp%>/mvproject/image/store_1.png">
</div>

  <br/><br/><br/>
	<div class="container" align="left">
	 	 <section id="about">
		      <div class="row">
		        <div class="col-lg-8 mx-auto" >
		        
		          <h3 style="margin-left: 0px;"><b>팝콘/음료/굿즈</b></h3> 
		      	</div>
	      	</div>
	  </section>
	 </div> 
	  <br/>
	  <div class="container">
		  <div class="row text-center" align="right" style="width: 850px;margin-left: 150px;">	
			  <c:forEach var="dto" items="${lists}">
			      <div class="col-lg-3 col-md-6 mb-4">
			        <div class="card h-100">
			          <a href="<%=cp%>/store/storeInfo.do?num=${dto.num}"><img class="card-img-top" src="${imagePath}/${dto.saveFileName}" alt="" width="250" height="150"></a>
			          <div class="card-body">
			            <h5 class="card-title"><b>${dto.subject}</b></h5>
			            <p class="card-text" align="right">${dto.price}원</p>
			          </div>
			        </div>
			      </div>
			 </c:forEach> 
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