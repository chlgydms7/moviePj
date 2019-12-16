<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");	
	String cp = request.getContextPath();
	int count = 0;
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>회원가입,cgv</title>

<script type="text/javascript" src="<%=cp %>/jspProject/js/util.js"></script>
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
		
		str = f.userId.value;
		str = str.trim();
		if(!str){
			alert("아이디를 입력하세요!");
			f.userId.focus();
			return;
		}
		f.userId.value = str;

		
		str = f.userPwd.value;
		str = str.trim();
		if(!str){
			alert("패스워드를 입력하세요!");
			f.userPwd.focus();
			return;
		}
		f.userPwd.value = str;
		
	
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
		
		str = f.userEmail.value;
		str = str.trim();
		if(!str){
			alert("E-mail을 입력하세요!");
			f.userEmail.focus();
			return;
		}
		f.userEmail.value = str;
		
		str = f.userEmail.value;
		str = str.trim();
		if(str){
			if(!isValidEmail(str)){
			alert("정상적인 이메일을 입력하세요.");
			f.email.focus();
			return;
			}
		}
		f.userEmail.value = str;
		
		f.action = "<%=cp%>/movie/signUp_ok.do";
		alert("회원가입 완료");
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
<!-- Bootstrap core CSS -->
<link href="<%=cp%>/jspProject/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/scrolling-nav.css" rel="stylesheet">
</head>
<body id="page-top" style="align-content: center; align-items: center; align-self: center;">

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
			<div style="display: inline-block; margin-top:10px; float: left; width: 80%; padding-left:30px; padding-top: 20px; margin-bottom: -10px;" > 
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
	<img src="<%=cp%>/jspProject/image/Gline.png" > 
<br><br>
	
	<div style="height: 50px;"></div>
	<div class="container">
		<section id="about">
			<div class="row" style="height: 100px; margin-left: 280px;"">
				<div class="col-lg-8 mx-auto">
				<p style="font-size: 30px; margin-left: -100px;" align="left"><b>CGV+CJ ONE 통합회원 가입</b></p>
				</div>
			</div>
		</section>

 <div id="bbs" >
	
	<form action="" method="post" name="myForm" >
		<div style="padding-left: 380px;">
		<div id="bbsCreated">
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt> 이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</dt>
					<dd>
						<input type="text" name="userName" size="35" maxlength="50" class="boxTF" style="height: 40px;border-color: #EAEAEA;border-style: solid;"/>
					</dd>
				</dl>
			</div>
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt> 아&nbsp;이&nbsp;디</dt>
					<dd>
						<input type="text" name="userId" size="35" maxlength="20" class="boxTF" style="height: 40px; border-color: #EAEAEA;border-style: solid;"/>
					</dd>
				</dl>
			</div>
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt> 패스워드</dt>
					<dd>
						<input type="password" name="userPwd" size="35" maxlength="20" class="boxTF" style="height: 40px;border-color: #EAEAEA;border-style: solid;"/>
					</dd>
				</dl>
			</div>
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt> 생년월일</dt>
					<dd>
						<input type="text" name="userBirth" size="35" maxlength="50" class="boxTF" style="height: 40px;border-color: #EAEAEA;border-style: solid;"
						placeholder="&nbsp;&nbsp;&nbsp;YYYY-MM-DD" aria-label="&nbsp;&nbsp;&nbsp;YYYY-MM-DD"/>
					</dd>
				</dl>
			</div>

		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt> 휴대전화</dt>
					<dd>
						<input type="text" name="userTel" size="35" maxlength="50" class="boxTF" style="height: 40px;border-color: #EAEAEA;border-style: solid;"/>
					</dd>
				</dl>
			</div>
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt> 이메일</dt>
					<dd>
						<input type="text" name="userEmail" size="35" maxlength="50" class="boxTF" style="height: 40px;border-color: #EAEAEA;border-style: solid;"/>
					</dd>
				</dl>
			</div>

		</div>
		</div>
		
	<div id="bbsCreated_footer" style="margin-left: 0px; padding-left: 380px;">

			        
			<input type="button" value="가입하기" class="btn btn-primary"" onclick="sendIt();"/>
			<input type="reset" value="다시입력" class="btn btn-primary"" onclick="document.myForm.userName.focus();"/>
			<input type="button" value="가입취소" class="btn btn-primary"" onclick="javascript:location.href='<%=cp%>/movie/login.do';"/>
	
		</div>
	
	</form>
	</div>
	</div>
<table align="center" style=" margin-left: 50px; width: 850px; height: 150px;">

</table>
	
</div>
<div class="floating">
	<img style="border: 3px solid red; border-radius: 7px;" src="<%=cp%>/jspProject/image/floating.png">
</div>
<div id="footer">
	<img src="<%=cp%>/jspProject/image/underimage.png">
</div>
	<!-- Footer -->
	<footer style= background-image:url('<%=cp%>/jspProject/image/bottomimage.png');">
	
	</footer>
	

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom JavaScript for this theme -->
	<script src="js/scrolling-nav.js"></script>

</body>

