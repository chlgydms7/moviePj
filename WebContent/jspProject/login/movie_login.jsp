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
<title>로그인</title>

<link href="<%=cp%>/jspProject/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=cp%>/jspProject/css/style.css" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">

<script type="text/javascript" src="<%=cp %>/jspProject/js/util.js"></script>
<script type="text/javascript">

 	window.onload=function(){
		if(getCookie("userId")){
			document.myForm.userId.value=getCookie("userId");
			document.myForm.idSaveCheck.checked=true;
		}
	}
	
	 //쿠키 저장함수
	function setCookie(name, value, expiredays) {
		 var todayDate = new Date();
		 todayDate.setDate(todayDate.getDate() + expiredays);
		 document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}	
	
	//쿠키 불러오는 함수
	function getCookie(Name) { 
        var search = Name + "=";
        
        if (document.cookie.length > 0) { // if there are any cookies
            offset = document.cookie.indexOf(search);
        
            if (offset != -1) { // if cookie exists
                offset += search.length; // set index of beginning of value
                end = document.cookie.indexOf(";", offset); // set index of end of cookie value
        
                if (end == -1)
                    end = document.cookie.length;
                return unescape(document.cookie.substring(offset, end));
            }
        }
    }
	
	function sendIt(){
    	
		var f = document.myForm;
		
		str = f.userId.value
		str = str.trim();
		if(!str){
			alert("아이디를 입력하세요");
			f.userId.focus();
			return;
		}
		
		str = f.userPwd.value
		str = str.trim();
		if(!str){
			alert("비밀번호를 입력하세요");
			f.userPwd.focus();
			return;
		}
		
	 	if(f.idSaveCheck.checked == true){
			setCookie("userId",f.userId.value,7);
		} else {
			setCookie("userId",f.userId.value,0);
		}
	 	
	 	f.action = "<%=cp%>/movie/login_ok.do";
	 	
		f.submit();
		 
	}
	
</script>

<style type="text/css">
/* 기본 css */
a:link { text-decoration: none;}
a:hover { text-decoration: none;}

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
<body style="background-color: #FDFCF0;">

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
				<a href="<%=cp %>/movie/movie_evaluation_select.do" style="color: #222222; font-size: 14pt;"><b>영화정보</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=cp %>/movie/movie_select.do" style="color: #222222; font-size: 14pt;"><b>예매</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%=cp %>/store/list.do" style="color: #222222; font-size: 14pt;"><b>스토어</b></a>
				<br><br>
				</div>
			</div>	
	</div>
</div>
<img src="<%=cp%>/jspProject/image/Gline.png">
<br><br>


<img width="100%" src="<%=cp %>/jspProject/image/loginbanner.jpg" >
<br/><br/><br/><br/><br/><br/>

<form action="" method="post" name="myForm">

<div align="center">
	<table width="820px" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td colspan="4" align="left"><img src="<%=cp %>/jspProject/image/logintab.jpg">	</td>
	</tr>
	<tr height="2px">
		<td colspan="2" width="440px" bgcolor=#898987></td>
		<td rowspan="8"  width="31px"></td>
		<td rowspan="8" width="349px"><img alt="Event Banner" src="<%=cp %>/jspProject/image/loginside.jpg"></td>
	</tr>
	<tr height="39px" valign="middle">
		<td colspan="2" width="440px" align="center"><font face="verdana" size="2" ><b>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</b></font></td>
	</tr>

	<tr height="30px">
		<td colspan="2" align="center"><input type="text" name="userId" placeholder="아이디를 입력하세요" style="text-align:left; padding-left:10px; width:230px; height:42px; letter-spacing: 3px" /></td>
	</tr>
	<tr height="30px">
		<td colspan="2" align="center"><input type="password" name="userPwd" placeholder="패스워드를 입력하세요" style="text-align:left; padding-left:10px; width:230px; height:42px; letter-spacing: 3px"/></td>
	</tr>
	<tr height="30px">
		<td colspan="2" align="center"><input type="button" value="로  그  인" style="text-align:center; width:230px; height:42px; letter-spacing: 5px" class="btn2" onclick="sendIt();" /></td>
	</tr>
	
	<tr>
		<td align="center" colspan="2"><font size="2" color="red">${message }</font></td>
	</tr>

	<tr valign="middle">
		<td width="220px" align="left"><input type="checkbox" name="idSaveCheck" /><font face="verdana" size="2" >아이디 저장</font></td>
		<td width="220px" align="right">
			<font size="2">
		 	<a href="<%=cp%>/movie/findId.do"><font face="verdana" size="2" >아이디 찾기&nbsp;></font></a>&nbsp;&nbsp;
		 	<a href="<%=cp%>/movie/findPwd.do"><font face="verdana" size="2" >비밀번호 찾기&nbsp;></font></a>
		 	</font>
		</td>
	</tr>
	<tr height="40px">
		<td colspan="2" width="440px"></td>
	</tr>
	<tr height="2px">
		<td colspan="2" width="440px" bgcolor=#898987></td>
	</tr>
	<tr height="30px"></tr>
	<tr>
		<td colspan="4">
			<img src="<%=cp %>/jspProject/image/loginbottom.jpg" width="820"/>
		</td>
	</tr>
</table>
</div>
<br/><br/><br/><br/>	

<div id="footer">
	<img src="<%=cp%>/jspProject/image/underimage.png">
</div>


</form>



</body>
</html>