<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

<title>상품페이지</title>
<link rel="stylesheet" href="<%=cp%>/mvproject//vendor/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=cp%>/mvproject/vendor/bootstrap/jquery/jquery.slim.min.js" ></script>
<script type="text/javascript" src="<%=cp%>/mvprojectvendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	
	var paysell_price;
	var basketsell_price;
	
	var amount;

	function init () {
		
		paysell_price = document.form.paysell_price.value;
		basketsell_price = document.basket.basketsell_price.value;
		
		payamount = document.form.amount.value;
		basketamount = document.basket.amount.value;
		
		document.form.storeSum.value = paysell_price;
		document.basket.storeSum.value = basketsell_price;
		
		change();
	}
	
	function add () {
		
		hmpay = document.form.amount;
		sumpay = document.form.storeSum;
		hmbasket = document.basket.amount;
		sumbasket = document.basket.storeSum;
		
		hmpay.value ++ ;
		hmbasket.value++;
		
		sumpay.value = parseInt(hmpay.value) * paysell_price;
		sumbasket.value = parseInt(hmbasket.value) * basketsell_price;
	}
	function del () {
		hmpay = document.form.amount;
		sumpay = document.form.storeSum;
		
		hmbasket = document.basket.amount;
		sumbasket = document.basket.storeSum;
			
		if (hmpay.value > 1 || hmbasket.value>1) {
				hmpay.value -- ;
				hmbasket.value -- ;
				sumpay.value = parseInt(hmpay.value) * paysell_price;
				sumbasket.value = parseInt(hmbasket.value) * basketsell_price;
			}
	}
	function change() {
		hmpay = document.form.amount;
		hmbasket = document.basket.amount;
		sumpay = document.form.storeSum;
		sumbasket = document.basket.storeSum;
			
		if (hmpay.value < 0 || hmbasket.value < 0) {
				hmpay.value = 0;
				hmbasket.value = 0;
		}
		sumpay.value = parseInt(hmpay.value) * paysell_price;
		sumbasket.value = parseInt(hmbasket.value) * basketsell_price;
	}
	
	function paymentsendIt() {
		
		var f = document.form;
		
		var session = "<c:out value='${sessionScope.customInfo.userId}'/>";
		if(session == ""){
			alert("로그인 되지 않았습니다. 로그인 해주세요 ");
			f.action = "<%=cp%>/movie/login.do";
			f.submit();
		}else{
			f.action = "<%=cp%>/store/paymentInsertData.do?num=${dto.num}";
			f.submit();		
		}
	
	}
	
	function bastketSendIt() {
		
		var f = document.basket;
		
		var session = "<c:out value='${sessionScope.customInfo.userId}'/>";
		if(session == ""){
			alert("로그인 되지 않았습니다. 로그인 해주세요 ");
			f.action = "<%=cp%>/movie/login.do";
			f.submit();
		}else{
			f.action = "<%=cp%>/store/paymentInsertData.do?num=${dto.num}";
			f.submit();		
		}
	
	}
	
</script>
</head>
<body style=" align-content:center; font-family: ;" onload="init();" >
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
<!-- Page Content -->

<div class="container">
  <!-- Portfolio Item Heading --><br/>
  <h1 class="my-4" style="margin-left: 50px;">상품/음료/굿즈</h1>
  <small ><h3 style="margin-left: 50px;"><b> ${dto.subject}</b>/기프트콘</h3></small>
  <hr width =100% color="black" align="left" size=30 style="margin-left: 50px;"/>
	<br/>
  <!-- Portfolio Item Row -->
  <div class="row" >
    <div class="col-md-7">
      <img class="img-fluid" src="${imagePath}/${dto.saveFileName}" style="padding-left: 50px"  width="500" height="450" alt="">
    </div>
    <div class="col-md-5" >
      <h4 class="my-3"><font style=""><b>${dto.price}원</b></font></h4>
        <hr width =100% color="#ccccc" align="left" size=30/>
      <h5><b>원 산 지 : 미국 </b></h5>
      <br/>
      <h5><b>유효기간 : 구매일로 부터 6개월</b></h5>
      <br/>
      <h5><b>상품 수량</b></h5>
      
      <form action=""  name="form" method="post">
	      	<input type= "hidden" name="paysell_price" value="${dto.price}">
			<input type="text" style="text-align: center"  name="amount" value="1" size="3" onchange="change();">
			<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>
		      <h3 class="my-3"><b>총 구매금액 :</b>&nbsp;&nbsp;<b><input type="text" name="storeSum" size="4" readonly style="border:none;">원</b></h3>
		      <input type="button" class="btn btn-primary" value="구매취소" style="width: 200px;height: 50px;" onclick="javascript:location.href='<%=cp%>/store/list.do';"/>
			  <input type="submit" class="btn btn-primary" value="구매하기" style="width: 200px;height: 50px;" onclick="paymentsendIt();"/>
	  </form>
	  <br/>
	   <form action="" method="post" name="basket" style="align-content: center;">
		   <input type= "hidden" name="basketsell_price" value="${dto.price}">
		   <input type="hidden" style="text-align: center;"  name="amount" value="1" size="3" onchange="change();">
	       <input type="hidden" name="storeSum" size="4" readonly style="border:none;background-color: #FEF8DC;">
	       <input type="submit" class="btn btn-primary" value="장바구니" style="width: 405px;height: 50px; align-self: center;" onclick="bastketSendIt()"/>
	       <!-- <input type="image" src="<%=cp%>/mvproject/image/basketimage.jpg" width="70" border="0" onclick="bastketSendIt();">-->
	   </form> 
	  <br/><br/>	
    </div>

  </div>
    <hr width =100% color="black" align="left" size=50 style="margin-left: 50px;"/>
  <div class="col-md-12" style="margin-left: 50px;">
  	<h4>&nbsp;이용안내</h4>
  	<ul>
	 <li> 해당 기프트콘은 오프라인 매점에서 실제 상품으로 교환할 수 있는 온라인 상품권입니다.</li>
	 <li>구매 후 전송받으신 기프트콘은,사용가능한 CGV의 매점에서 지정된 해당 상품으로만 교환이 가능합니다.
	     (사용가능 CGV는 '상품교환'에서 확인 가능합니다
	     해당 상품 내에서 팝콘 맛 혹은 사이즈 변경 시 추가 비용 발생합니다.교환 완료한 상품의 환불 및 반품은 불가합니다.</li>
	 <li>유효기간 연장을 신청하는 경우,유효기간은 발급일로부터 5년 이내 횟수 제한 없이 기간 연장 가능하며, 1회 연장 시 3개월(92일) 단위로 유효기간이 연장됩니다.  
	     단, 이벤트 경품 및 프로모션 상품의 경우 유효기간 연장이 불가할 수 있습니다. 유효기간 만료 이후에는 결제금액의 90% 환불이 가능합니다.</li>  
	 <li>상기 이미지는 실제와 다를 수 있습니다.</li>
 	</ul>
 	<h4>&nbsp;취소/환불 규정</h4> 
 	<ul>
 		<li>구매자는 최초 유효기간 이내에 결제금액의 100%에 대해 결제취소/환불이 가능하며, 최초 유효기간 만료 후에는 수신자가 결제금액의 90%에 대해 환불 요청 가능합니다.</li>
 		<li>단, 이미 사용된 기프트콘에 대해서는 결제취소/환불 신청이 불가합니다. </li>
 	</ul>
 	<h4>&nbsp;결제취소/환불 방법</h4>
 	<ul>
 		<li>결제취소는 모바일App,웹 > MY > 결제내역조회 > 스토어 or 홈페이지 > My CGV > 스토어 > 결제내역의 해당 주문 상세내역에서 가능합니다.</li>
 		<li>기프트콘은 구매일로부터 60일 이내 결제취소 가능하며, 카드 결제취소 가능 기간이 경과하였을 경우, 고객센터로 연락주시면 됩니다)
            환불은 모바일App,웹 > MY > 기프트콘 or 홈페이지 > My CGV > 스토어 > 내 기프트콘에서 환불을 원하는 기프트콘 등록 후 진행 가능하며, 비회원의 경우 고객센터로 신청 가능합니다.</li>
 	</ul>
 	<h4>&nbsp;단 이 때, 본인 확인 및 계좌 확인 절차가 진행됩니다.</h4>
 	<ul>
 		<li>수신자는 선물받은 기프트콘의 수신거절을 요청할 수 있으며, 이 경우 구매자에게 취소 및 환불에 대한 안내가 이루어집니다.</li>
 		<li> 결제취소 가능 기간이 경과한 후 수신자가 수신거절을 요청할 경우 구매자에게 기프트콘이 재발송됩니다.</li>
 	</ul>
  </div>
  <!-- /.row -->
  <!-- Related Projects Row -->
  <br/>
    <hr width =100% color="#ccccc" align="left" size=50 style="margin-left: 50px;"/>
    <br/><br/>
  <h4 class="my-4" style="margin-left: 60px;">이 상품과 함께 본 상품</h4>
    <hr width =100% color="#ccccc" align="left" size=50 style="margin-left: 50px;"/>
  <div class="row" style="margin-left: 50px;">
  	<c:forEach var="dto" items="${lists}">
	  	<c:if test="${dto.num<=4 }">
	  	<div class="col-md-3 col-sm-6 mb-4">
	      <a href="<%=cp%>/store/storeInfo.do?num=${dto.num}">
	      	<!-- image size 500*300 -->
	        <img class="img-fluid" src="${imagePath}/${dto.saveFileName}">
	      </a>
	       <h5><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       ${dto.subject}</b></h5>
	    </div>
	   </c:if> 
    </c:forEach>
  </div>
  <!-- /.row -->
  
</div>
<!-- /.container -->
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