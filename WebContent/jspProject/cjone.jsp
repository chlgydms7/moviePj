<%@page import="com.movie.Movie_PaymentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<title>영화 그 이상의 감동. CGV(결제창)</title>

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

.btn3{
border: 1px solid;
border-color: rgb(146,111,96);
background-color: rgb(146,111,96);
color: white;
border-radius: 5px;
height: 28px;
}

.btn4{
border: 1px solid;
border-color: rgb(130,137,142);
background-color: rgb(130,137,142);
color: white;
border-radius: 5px;
height: 28px;
}

</style>

<script type="text/javascript">

	function showHide(id) {

		var obj = document.getElementById(id);

   		 if (obj.style.display == 'none'){
   	    	 obj.style.display = 'block';
   	 	}else{
      		  obj.style.display = 'none';
   	 	}

	}
	
	function chkBoxCheck(chknum) {

	   // 체크박스 갯수만큼 반복문을 돌면서
	   for (j = 0; j < 2; j++) {

	        // 체크박스가 선택되어 있으면
	        if (eval("document.myForm.pay[" + j + "].checked") == true) {

	             // 우선 체크박스의 속성을 선택되지 않음으로 하고
	             document.myForm.pay[j].checked = false;

	           // 사용자가 클릭한 체크박스와 프로그래밍적으로 돌고 있는
	           // 체크박스의 번호가 같으면
	            if (j == chknum) {

	                  // 이런 경우만 체크박스가 선택되도록 한다...
	                  document.myForm.pay[j].checked = true;
	        	}
	    	}
		}
	}
	
	function sendIt() {
		
		var f = document.myForms;
		
		if(!f.num1.value){
			alert("카드번호를 입력해주세요.");
			f.num1.focus();
			return;
		}
		
		if(!f.num2.value){
			alert("카드번호를 입력해주세요.");
			f.num2.focus();
			return;
		}
		
		if(!f.num3.value){
			alert("카드번호를 입력해주세요.");
			f.num3.focus();
			return;
		}
		
		if(!f.num4.value){
			alert("카드번호를 입력해주세요.");
			f.num4.focus();
			return;
		}
		
		if(!f.month.value){
			alert("카드 유효기간을 정확히 입력해주세요.");
			f.month.focus();
			return;
		}
		if(!f.year.value){
			alert("카드 유효기간을 정확히 입력해주세요.");
			f.year.focus();
			return;
		}
		
		if(!f.password.value){
			alert("비밀번호를 입력해주세요.");
			f.password.focus();
			return;
		}
		
		if(!f.birth.value){
			alert("생년월일을 입력해주세요.");
			f.birth.focus();
			return;
		}
		

		alert("결제를 진행할까요?");
		f.action= '<%=cp%>/movie/buy_ok.do';
		f.submit();
	}
	

</script>

</head>
<body leftmargin="0" rightmargin="0" bgcolor="#FDFCF0">

<div class="floating">
	<div>
		<dl style="background-color: white; color: #5a5a5a; height: 35px; border-top-left-radius: 5px; border-top-right-radius: 5px; margin-bottom: -20px; border: 1px solid #5a5a5a;"><b>결제하실 금액</b></dl>
		<dl style="background-color: rgb(71,71,71); color: white; height: 50px; text-align: right; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; margin-bottom: -20px; font-size: 15pt;" ><b>${cost }&nbsp;원&nbsp;</b></dl>
	</div>
<br/><br/>
	<div>
		<dl style="background-color: rgb(217,231,235); color: #5a5a5a; height: 25px; border-top-left-radius: 5px; border-top-right-radius: 5px; margin-bottom: -20px; border: 1px solid #5a5a5a;"><b>할인내역</b></dl>
		<dl style="background-color: white; color: #5a5a5a; height: 35px; border: 1px solid #5a5a5a; margin-bottom: -20px;"><b>총 할인금액</b></dl>
		<dl style="background-color: rgb(60,70,79); color: rgb(137,229,255); height: 50px; text-align: right; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; margin-bottom: -20px; font-size: 15pt;" ><b>0&nbsp;원&nbsp;</b></dl>
	</div>
<br/>
	<div>
		<dl style="background-color: rgb(240,235,210); color: #5a5a5a; height: 25px; border-top-left-radius: 5px; border-top-right-radius: 5px; margin-bottom: -20px; border: 1px solid #5a5a5a;"><b>결제내역</b></dl>
		<dl style="background-color: white; color: #5a5a5a; height: 35px; border: 1px solid #5a5a5a; margin-bottom: -20px;"><b>남은 결제금액</b></dl>
		<dl style="background-color: rgb(67,48,40); color: rgb(255,229,107); height: 50px; text-align: right; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; margin-bottom: -20px; font-size: 15pt;" ><b>${cost }&nbsp;원&nbsp;</b></dl>
	</div>
</div>

<!-- header부분 -->

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
				<a href="<%=cp%>/movie/main.do"><img style="padding-left: 20px;" src="<%=cp %>/jspProject/image/cgvLogo.png"></a>
				</h1>
			</div>
			<div style="display: inline-block; margin-top:10px; float: left; width: 80%" > 
				<h3 align="left" style="width: 550px; margin-left: 70px; margin-right: 0;">
					<img src="<%=cp %>/jspProject/data/image/ticket.png">
				</h3>
				<div id="nav" align="left" style="padding-left:50px; margin-right: 170px;">
				<a href="<%=cp %>/movie/movie_evaluation_select.do" style="color: black; font-size: 14pt;"><b>영화</b></a>&nbsp;&nbsp;&nbsp;
				<a href="<%=cp %>/movie/movie_select.do" style="color: black; font-size: 14pt;"><b>예매</b></a>&nbsp;&nbsp;&nbsp;
				<a href="<%=cp %>/store/list.do" style="color: black; font-size: 14pt;"><b>스토어</b></a>
				<br><br>
				</div>
			</div>	
	</div>
</div>
<img src="<%=cp %>/jspProject/image/Gline.png">
<br/><br/><br/><br/>

<!-- 결제창 -->

<table width="800" align="center">
<tr align="right">
	<td align="right">
		<input type="button" id="test_btn1" value="예매 다시하기" onclick="javascript:location.href='<%=cp%>/movie/movie_select.do';"/>
	</td>
</table>

<br/>

<table width="800" align="center" cellpadding="0" cellspacing="0" style="background-color: rgb(242,240,229);">

<tr style="background-color: rgb(51,51,51); color: white;" height="40" >
	<td align="left"><b>&nbsp;&nbsp;STEP 1.</b></td>
	<td align="right"><a onclick="location.reload();" style="color: white; cursor: pointer;" type="reset"><b>다시하기&nbsp;&nbsp;</b></a></td>
</tr>

<tr height="3">
	<td colspan="2" bgcolor="#fef8dc"></td>
</tr>

<tr style="color: rgb(51,51,51); background-color: rgb(223,222,214)" height="50">
	<td align="left">
		<b>&nbsp;&nbsp;할인쿠폰</b>
	</td>
	<td align="right">
		<a onclick="showHide('coupon')" onfocus="this.blur()">
			<img src="<%=cp%>/jspProject/data/image/under_1.png" width="40" height="40"/>&nbsp;&nbsp;
		</a>
	</td>
</tr>

</table>

<table id="coupon" width="800" align="center" cellpadding="0" cellspacing="0" style="background-color: rgb(242,240,229);">

	<tr height="30">
		<td style="background-color: rgb(249,248,243); color: rgb(102,102,102); text-align: center; font-size: 10pt; font-family: 고딕체; border: 1px solid; border-color: rgb(223,222,214);" align="center" colspan="2" width="800" height="30">
			<b>선택 불가능한 할인 쿠폰 항목은 비활성화처리됩니다.</b>
		</td>
	</tr>
	
<%-- 	<tr height="50">
	<%if(==cgv){ %>
	<%}else if(==cjone){ %>
	<td rowspan="2">             </td>
	<%} %> --%>
	
	<tr height="50" style="border: 1px solid; border-color: rgb(223,222,214);">
		<td width="200" style="border: 1px solid; border-color: rgb(223,222,214); cursor: pointer;" onclick="javascript:location.href='<%=cp%>/movie/cgv.do';">
		
			<b>&nbsp;CGV 할인쿠폰</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="<%=cp%>/jspProject/data/image/thenext2.png">
		</td>
		<td style="border: 1px solid; border-color: rgb(223,222,214); color: rgb(102,102,102); font-family: 굴림;" rowspan="3" align="center">
			<table width="600" align="center" cellpadding="0" cellspacing="0" style="background-color: rgb(242,240,228); border: 1px;">
<tr height="50">
	<td colspan="2" style="color: rgb(48,103,145); font-family: 굴림;"><b>&nbsp;&nbsp;●CJ ONE 할인쿠폰</b></td>
	<td align="right">
		<input type="button" class="btn3" value="전체 쿠폰" onclick=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</td>
</tr>
<tr>
	<td width="200" style="font-size: 10pt; color: rgb(102,102,102); font-family: 굴림;" align="left" height="30">&nbsp;&nbsp;&nbsp;&nbsp;사용가능 쿠폰</td>
	<td width="200" style="font-size: 10pt; color: rgb(102,102,102); font-family: 굴림;" align="center" height="30">&nbsp;&nbsp;&nbsp;&nbsp;쿠폰 번호</td>
	<td width="200" style="font-size: 10pt; color: rgb(102,102,102); font-family: 굴림;" align="left" height="30">&nbsp;&nbsp;&nbsp;&nbsp;유효기간</td>
</tr>

<tr height="2">
	<td colspan="3" style="background-color: rgb(223,222,214);"></td>
</tr>

<tr height="250">
	<td align="center" colspan="3" style="background-color: rgb(242,240,228);">사용 가능한 CJ ONE 할인 쿠폰이(가) 없습니다.</td>
</tr>

<tr height="2">
	<td colspan="4" style="border-style: dotted; border-color: rgb(223,222,214);"></td>
</tr>

<tr>
	<td colspan="4" align="right" height="30" style="color: rgb(102,102,102); font-family: 굴림;">할인금액:&nbsp;&nbsp;&nbsp;&nbsp;0 원</td>
</tr>

<tr align="center" style="border-bottom: 2px solid; border-top: 2px solid; border-left: 2px solid; border-right: 2px solid;" bordercolor="rgb(223,222,214)">
	<td width="100" align="center" style="border-right: 3px solid; border-color: rgb(223,222,214); font-size: 12pt; font-family: 굴림;">
		<b>이용안내</b>
	</td>
	<td align="left"  colspan="3" style="color: rgb(102,102,102); font-size: 10pt; font-family: 굴림;">
		<br/>&nbsp;&nbsp;CJ ONE 쿠폰은 최대 3매까지 사용이 가능합니다.<br/>
		&nbsp;&nbsp;유효기간 만료 시, 기 예매된 티켓의 취소 후 재사용 불가합니다.<br/><br/></td>
</tr>


</table>
		</td>
	</tr>
	<tr height="50">
		<td width="200" style="border-top: 1px solid; border-right: 1px solid; border-top-color: rgb(223,222,214); border-right-color: rgb(223,222,214); cursor: pointer;" onclick="javascript:location.href='<%=cp%>/movie/sit_ok.do';">
			<b>&nbsp;CJ ONE 할인쿠폰</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="<%=cp%>/jspProject/data/image/thenext2.png">
		</td>
		<td style="border: 1px solid; border-color: rgb(223,222,214);">             </td>
	</tr>
	
	<tr height="3">
		<td colspan="2" style="background-color: rgb(242,240,229);"></td>
	</tr>
	
</table>

<table width="800" align="center" cellpadding="0" cellspacing="0" bgcolor="#FEF8DC">

<tr height="40" style="background-color: rgb(223,222,214);"></tr>

<tr style="background-color: rgb(51,51,51); color: white;" height="40" >
	<td align="left"><b>&nbsp;&nbsp;STEP 2.</b></td>
	<td align="right"><a onclick="location.reload();" style="color: white; cursor: pointer;" type="reset"><b>다시하기&nbsp;&nbsp;</b></a></td>
</tr>

<tr height="3">
	<td colspan="2" style="background-color: rgb(242,240,229)"></td>
</tr>

<tr style="color: rgb(51,51,51); background-color: rgb(223,222,214)" height="50">
	<td align="left">
		<b>&nbsp;&nbsp;관람권/기프티콘</b>
	</td>
	<td align="right">
			<img src="<%=cp%>/jspProject/data/image/under_1.png" width="40" height="40"/>&nbsp;&nbsp;
		</a>
	</td>
</tr>

<tr height="40" style="background-color: rgb(223,222,214);"></tr>

</table>

<table width="800" align="center" cellpadding="0" cellspacing="0" bgcolor="#FEF8DC">

<tr height="3">
	<td colspan="2" style="background-color: rgb(242,240,229)"></td>
</tr>

<tr style="background-color: rgb(51,51,51); color: white;" height="40" >
	<td align="left"><b>&nbsp;&nbsp;STEP 3.</b></td>
	<td align="right"><a onclick="location.reload();" style="color: white; cursor: pointer;" type="reset"><b>다시하기&nbsp;&nbsp;</b></a></td>
</tr>

<tr height="3">
	<td colspan="2" style="background-color: rgb(242,240,229)"></td>
</tr>

<tr style="color: rgb(51,51,51); background-color: rgb(223,222,214)" height="50">
	<td align="left">
		<b>&nbsp;&nbsp;포인트 및 기타결제 수단</b>
	</td>
	<td align="right">
			<img src="<%=cp%>/jspProject/data/image/under_1.png" width="40" height="40"/>&nbsp;&nbsp;
		</a>
	</td>
</tr>

<tr height="40" style="background-color: rgb(223,222,214);"></tr>

</table>

<table width="800" align="center" cellpadding="0" cellspacing="0" bgcolor="#FEF8DC">

<tr height="3">
	<td colspan="2" style="background-color: rgb(242,240,229)"></td>
</tr>

<tr style="background-color: rgb(51,51,51); color: white;" height="40" >
	<td align="left"><b>&nbsp;&nbsp;STEP 4.</b></td>
	<td align="right"><a onclick="location.reload();" style="color: white; cursor: pointer;" type="reset"><b>다시하기&nbsp;&nbsp;</b></a></td>
</tr>

<tr height="3">
	<td colspan="2" style="background-color: rgb(242,240,229)"></td>
</tr>

<tr style="color: rgb(51,51,51); background-color: rgb(223,222,214)" height="50">
	<td align="left">
		<b>&nbsp;&nbsp;최종결제 수단</b>
	</td>
	<td align="right">
	</td>
</tr>

</table>

<form action="" name="myForms" method="post">

<table width="800" align="center" cellpadding="0" cellspacing="0" bgcolor="#FEF8DC">
<tr> 
	<td style="font-family: 굴림; background-color: rgb(242,240,229);" height="50">
		<input type="checkbox" name="pay" value="신용카드" onclick="chkBoxCheck(0);" checked="checked"/><b>신용카드&nbsp;&nbsp;&nbsp;&nbsp;</b>
		<select name="payMethod">
			<option value="selected">카드를 선택하세요</option>
			<option value="BC카드">BC카드</option>
			<option value="현대카드">현대카드</option>
			<option value="KEB하나카드(구,외환)">KEB하나카드(구,외환)</option>
			<option value="삼성카드">삼성카드</option>
			<option value="신한카드">신한카드</option>
			<option value="KB국민카드">KB국민카드</option>
			<option value="카카오뱅크카드">카카오뱅크카드</option>
			<option value="NH카드">NH카드</option>
			<option value="시티카드">시티카드</option>
			<option value="우리카드">우리카드</option>
			<option value="하나카드">하나카드</option>
			<option value="수협카드">수협카드</option>
			<option value="신세계카드">신세계카드</option>
			<option value="광주은행카드">광주은행카드</option>
			<option value="산은캐피탈">산은캐피탈</option>
			<option value="스탠다드차타드은행카드">스탠다드차타드은행카드</option>
			<option value="롯데/아멕스카드">롯데/아멕스카드</option>
			<option value="K뱅크">K뱅크</option>
		</select>
	</td>
</tr>
	
<tr>
	<table width="800" height="200" align="center" cellpadding="0" cellspacing="0" style="background-color: rgb(242,240,229); border-top: 2px solid; border-color: rgb(223,222,214)">
<tr>
	<td width="20"></td>
	<td height="50" align="right" width="130" style="font-size: 10pt; border-bottom: 1px solid; border-bottom-color: rgb(223,222,214);">카드번호</td>
	<td style="border-bottom: 1px solid; border-bottom-color: rgb(223,222,214);">
		&nbsp;&nbsp;<input name="num1" type="text" size="5" maxlength="4">&nbsp;-&nbsp;<input name="num2" type="text" size="5" maxlength="4">&nbsp;-&nbsp;
		<input name="num3" type="password" size="5" maxlength="4">&nbsp;-&nbsp;<input name="num4" type="password" size="5" maxlength="4">
	</td>
	<td width="20"></td>
</tr>

<tr>
	<td width="20"></td>
	<td height="50" align="right" width="130" style="font-size: 10pt; border-bottom: 1px solid; border-bottom-color: rgb(223,222,214);">유효기간</td>
	<td style="font-size: 10pt; border-bottom: 1px solid; border-bottom-color: rgb(223,222,214);">
		&nbsp;&nbsp;<input name="month" type="text" size="3" maxlength="2">&nbsp;<b>월</b>&nbsp;<input name="year" type="text" size="3" maxlength="2">&nbsp;<b>년</b>&nbsp;&nbsp;
		<font style="color: gray;">2015년 9월 -> 09월 15년</font>
	</td>
	<td width="20"></td>
</tr>

<tr>
	<td width="20"></td>
	<td height="50" align="right" width="130" style="font-size: 10pt; border-bottom: 1px solid; border-bottom-color: rgb(223,222,214);">비밀번호</td>
	<td style="font-size: 12pt; border-bottom: 1px solid; border-bottom-color: rgb(223,222,214);">
		&nbsp;&nbsp;<input name="password" type="text" size="3" maxlength="2"><b>**</b>
	</td>
	<td width="20"></td>
</tr>

<tr>
	<td width="20"></td>
	<td height="60" align="right" width="130" style="font-size: 10pt; border-bottom: 1px solid; border-bottom-color: rgb(223,222,214);">법정생년월일<br/>
	(6자리)</td>
	<td style="border-bottom: 1px solid; border-bottom-color: rgb(223,222,214);">
		&nbsp;&nbsp;<input name="birth" type="text" size="6" maxlength="6">&nbsp;-&nbsp;<b>*******</b>
	</td>
	<td width="20"></td>
</tr>

</table>
</tr>
</table>


<!-- </form> -->

<!-- <form action="" name="myForms"> -->

<table bordercolor="white" align="center" style="background-color: rgb(29,29,28);" width="1920" height="150">
<tr height="8">
	<td></td>
</tr>
<tr align="center">
	<td width="715" align="left"></td>
	<td width="100" align="left">
		<a href="<%=cp%>/movie/movie_select.do"><img alt="" src="<%=cp%>/jspProject/data/image/selectseat.png"></a>
	</td>
	<td width="200" style="color: rgb(204,204,193); border-right: 1px solid; font-size: 12pt;"><b>${movietype }</b></td>
	
	<td width="50" style="color: rgb(204,204,193); text-align: right; font-size: 10pt;">
		상영관<br/>일시<br/>인원
	</td>
	<td width="150" style="color: rgb(204,204,193); border-right: 1px solid; font-size: 10pt"><b>${roomtype }<br/>${timetype }<br/>${member }</b></td>
	
	<td width="50" style="color: rgb(204,204,193); text-align: right; font-size: 10pt">
		좌석<br/>번호
	</td>
	<td width="150" style="color: rgb(204,204,193); font-size: 10pt"><b><%List<Movie_PaymentDTO> lists=new ArrayList<>();
	lists=(List<Movie_PaymentDTO>)session.getAttribute("lists");
	for(Movie_PaymentDTO dto:lists){%>
	<%=dto.getSitnum() %><br>
	<%}%></b></td>
	
	
	<td width="200" align="left">
		<!-- <a href="javascript:alert('결제를 진행할까요?')"> --><img alt="" src="<%=cp%>/jspProject/data/image/pay.png" onclick="sendIt();"><!-- </a> -->
	</td>
	
	<td width="700" align="left"></td>
<tr height="8">
	<td></td>
	<td>
		<input type="hidden" name="movietype" value="${movietype }"/>
		<input type="hidden" name="timetype" value="${timetype }"/>
		<input type="hidden" name="roomtype" value="${roomtype }"/>
		<input type="hidden" name="sitnum" value="${dto.getSitnum() }"/>
		<input type="hidden" name="cost" value="${cost }"/>
		<input type="hidden" name="member" value="${member }"/>
</tr>
</table>
<!-- 열심히 하세용 -->
</form>
<table>
<tr>
	<td>
		<img alt="" src="<%=cp%>/jspProject/data/image/undercode.png">
	</td>
</tr>
</table>

</body>
</html>