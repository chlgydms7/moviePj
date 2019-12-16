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
	
	var session = "<c:out value='${sessionScope.customInfo.userId}'/>";
	if(session == ""){
		alert("로그인 되지 않았습니다. 로그인 해주세요 ");
		f.action = "<%=cp%>/movie/login.do";
		f.submit();
	}else{
		f.action = "<%=cp%>/store/bill.do";
		alert("결제를 진행할까요 ?");
		f.submit();		
	}
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

<body id="page-top" style="background-color: ;">
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

  <br/><br/>
	<div class="container" align="left">
	 	 <section id="about">
		      <div class="row">
		        <div class="col-lg-8 mx-auto" >
		          <h3 style="margin-left: -50px;"><b>팝콘/음료/굿즈</b></h3> 
		      	</div>
	      	</div>
	  </section>
	 </div> 
	  <br/>
	  <div class="container">
<div class="container" style="padding-left: 150px">
			<table style="width: 800px;" style="background-color: ">
				<tr><td style="font-size: 20px;">구매상품정보</td></tr>
				<tr><td style="height: 20px;"></td></tr>
				<tr height="3"><td colspan="8" bgcolor="black"></td></tr>
				<tr height="50">
					<td align="center" width="80">상품명</td>
					<td align="center" width="80">판매금액</td>
					<td align="center" width="60">수량</td>
					<td align="center" width="60">구매금액</td>
					<td align="center" width="60">상품삭제</td>
				</tr>
				<c:if test="${orderlists!=null}">
					<c:forEach var="dto" items="${orderlists}">
						<tr height="2"><td colspan="8" bgcolor="#cccccc"></td></tr>
							<tr height="30">
								<td align="center" width="50"><a href="<%=cp%>/store/storeInfo.do?num=${dto.num}"> 
								<img class="card-img-top" src="${imagePath}/${dto.saveFileName}" width="250" height="150">${dto.subject}</a></td>
								<td align="center" width="80">${dto.price}원</td>
								<td align="center" width="60">${dto.amount}개</td>
								<td align="center" width="60">${dto.storeSum}원</td>
								<td align="center" width="60"><a type="button"  href="javascript:location.href='<%=cp%>/store/storeDeleteDate.do?order_number=${dto.order_number}'" >상품삭제</a> </td>
							</tr>
					</c:forEach>
				</c:if>
				<c:if test="${orderlists == null}">
					주문한 상품이 없습니다.
				</c:if>
				<tr height="1"><td colspan="8" bgcolor="black"></td></tr>
			</table >	
			<table style="height: 50pt; "></table>
				<table style="width: 800px;">
					<tr><td style="height: 20px;"></td></tr>
		
					<tr height="3"><td colspan="5" bgcolor="#cccccc"></td></tr>
					<tr height="50">
						<td align="center" width="80">총 상품 금액</td>
						<td align="center" width="50"></td>
						<td align="center" width="80">할인금액</td>
						<td align="center" width="50"></td>
						<td align="center" width="100">총 결제 예정 금액</td>
					</tr>
					<tr height="2"><td colspan="5" bgcolor="#cccccc"></td></tr>
					<tr height="150">
						<td align="center" width="80" style="font-size: 30px;">${totalSum }원</td>
						<td align="center" width="50"><img alt="" src="<%=cp %>/mvproject/image/-.png" ></td>
						<td align="center" width="80" style="font-size: 30px;">0원</td>
						<td align="center" width="50"><img alt="" src="<%=cp %>/mvproject/image/=.png"></td>
						<td align="center" width="100" style="font-size: 30px; color: red;">${totalSum }원</td>
					</tr>
					<tr height="1"><td colspan="5" bgcolor="#cccccc"></td></tr>
				</table >
				<table style="width: 800px;">
					<tr>
						<td style="font-size: 20px;" colspan="4">주문자 정보 확인</td>
					</tr>
					<tr><td style="height: 20px;"></td></tr>
					<tr height="3">
						<td colspan="4" bgcolor="black"></td>
					</tr>
					<tr height="100">
						<td align="center" width="100" >이름</td>
						<td style="padding-left: 5px; " width="150"><input type="text" name="name"
							size="10" maxlength="10" class="txtField" value="${ticketdto.userName }"></td>
						<td align="center" width="100" >전화번호</td>
						<td style="padding-left: 5px;"><input type="text" name="tel"
							size="10" maxlength="30" class="txtField" value="${ticketdto.userTel }" ></td>	
					</tr>
					<tr height="1">
						<td colspan="4" bgcolor="#cccccc"></td>
					</tr>
					<tr><td colspan="4" style="font-size: 15px;">구매하신 CGV 기프트콘은 주문자 정보에 입력된 휴대전화 번호로 MMS로 발송됩니다.
					입력된 휴대전화 번호가 맞는지 꼭 확인하세요.</td></tr>
				</table>
				<table style="height: 50pt;"></table>
					<form action="" method="post" name="myForm">
						<table style="width: 800px;" border="0">
							<tr>
								<td style="font-size: 20px;" colspan="4">결제 수단</td>
							</tr>
							<tr><td style="height: 20px;"></td></tr>
							<tr height="2"><td colspan="4" bgcolor="black"></td></tr>			
							<tr height="100" style="margin-left: 20px;">
								<td colspan="2" >
									<input type="radio" name="pay" checked="checked"/>
								    <font>카드</font>
										<select name="cardType">
											<option value="국민카드" >카드를 선택하세요</option>
											<option value="KB카드">KB카드</option>
											<option value="BC카드">BC카드</option>
											<option value="삼성카드">삼성카드</option>
											<option value="신한카드">신한카드</option>
											<option value="외환카드">외환카드</option>
											<option value="하나카드">하나카드</option>
											<option value="롯데카드">롯데카드</option>
											<option value="씨티(한미)카드">씨티(한미)카드</option>
											<option value="광주카드">광주카드</option>
											<option value="현대카드">현대카드</option>
											<option value="전북카드">전북카드</option>
											<option value="NH카드">NH카드</option>
											<option value="수협카드">수협카드</option>
											<option value="제주카드">제주카드</option>
											<option value="신협체크카드">신협체크카드</option>
											<option value="우리(평화)카드">우리(평화)카드</option>
											<option value="카카오페이">카카오페이</option>			
										</select>
									</td>
								</tr>	
								<tr height="2">
									<td colspan="4" bgcolor="#cccccc"></td>
								</tr>
								<tr height="2">
									<td colspan="4" bgcolor="#cccccc"></td>
								</tr>
								<tr>
									<td colspan="4" style="font-size: 15px;"><font color="gray">카카오페이는
											신용카드 선할인과 카드사 포인트는 이용하실 수 없으며 신용카드별 청구 할인은 이용하실 수 있습니다.</font></td>
								</tr>
							</table>
							<input type="hidden" name="num" value="${dto.num}"/>
							<input type="hidden" name="storeSum" value="${storeSum}"/>	
						</form>	
						<table style="height: 50pt;"></table>
						<form name="fob">
						<table style="width: 800px;  height: 80px;">
							<tr style="margin-left: 20px;">
								<td><input type="checkbox" onclick="CheckAll(document.fob.aaa)" />
								<font size="4pt;">&nbsp;주문정보/결제 대행 서비스 약관 모두 동의</font></td>
								</tr>
						</table>
						<table style="width: 800px;  background-color: #EAEAEA;" border="0">
							<tr height="20">
								<td></td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="aaa"/>
								<font size="4pt;">&nbsp;기프티콘 구매 동의</font></td>
							</tr>
							<tr height="20">
								<td style="font-size: 13px;"><font color=#5E5E5E>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										기프트콘 발송 및 CS처리 등을 이해 수신자로부터 CJCGV에 수신자의 휴대전화번호를 제공하는 것에 대한 적합한 동의를
										받습니다.</font>
								<td>
							</tr>
							<tr height="20"><td colspan="4" ></td></tr>
							<tr height="2"><td colspan="4" bgcolor="#cccccc"></td></tr>
							<tr height="20"><td colspan="4" ></td></tr>
							<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="aaa"/>
							<font size="4pt;">&nbsp;결제대행 서비스약관 모두 동의</font></td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"	name="aaa"/>
								<font size="4pt;">&nbsp;전자금융거래 이용약관</font></td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="aaa" />
								<font size="4pt;">&nbsp;개인정보제공 및 위탁안내</font></td>
							</tr>
							<tr height="20">
								<td></td>
							</tr>
						</table>
						</form>
						<table style="height: 50pt;"></table>
						<table style="width: 800px; margin-left: 50px;">
							<tr align="center">
								<td><input type="button" value="결제하기" class="btn btn-primary" onclick="paymentSendIt();"/></td>
							</tr> 
						</table>					
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