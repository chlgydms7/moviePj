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
<title>이미지 게시판 </title>
<link rel = "stylesheet" href="<%=cp%>/mvproject/css/created.css">
<link rel = "stylesheet" href="<%=cp%>/mvproject/css/style.css">
<script type="text/javascript" src="<%=cp%>/mvproject/js/image.js"></script>
</head>
<body>
	<div id = "bbs">
		<div id="bbs_title">
			<b>스낵넣기</b> 
		</div>
		<form action="" name="myForm" method="post" enctype="multipart/form-data">
			<div id="bbsCreated">
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>제목</dt>
						<dd><input type="text" name="subject" size="50" maxlength="100" class="boxTF" style="width: 350px"/></dd>
					</dl>
				</div>
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>가격</dt>
						<dd><input type="text" name="price"  size="50" maxlength="100" class="boxTF" style="width: 350px"/></dd>					
					</dl>
				</div>	
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>파일</dt>
						<dd><input type="file" name="upload"  size="50" maxlength="100" class="boxTF" style="width: 350px"/></dd>					
					</dl>
				</div>
			</div>
			<div align="center">
				<input type="button" value="등록하기" onclick="sendIt();" />
			</div>
		</form>	
	</div>
</body>
</html>