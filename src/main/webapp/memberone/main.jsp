<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/custom.css">
	<title>메인페이지</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</head>
<body>
	<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
	%>
	<nav class="navbar navbar-default">
	 <div class="navbar-header">
	  <button type="button" class="navbar-toggle collapsed"
	  	data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
	  	aria-expanded="false">
		 	<span class="icon-bar"></span>
		 	<span class="icon-bar"></span>
		 	<span class="icon-bar"></span>
		 </button>
		 <a class="navbar-brand" href="main.jsp">AR 웹페이지</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		 <ul class="nav navbar-nav">
		  <li class="active"><a href="main.jsp">메인</a>
		   <li class="active"><a href="../boardone/list.jsp">게시판</a>
		 </ul>
		 <%
		 	if(id == null){
		 %>
		 <ul class="nav navbar-nav navbar-right">
		  <li class="dropdown">
		   <a href="#" class="dropdown-toggle"
		   	data-toggle="dropdown" role="button" aria-haspopup="true"
		   	aria-expanded="false">접속하기<span class="caret"></span>
		   </a>
		   <ul class="dropdown-menu">
		   	<li><a href="login.jsp">로그인</a></li>
		   	<li><a href="regForm.jsp">회원가입</a></li>
		   </ul>
		  </li>
		 </ul>
		 <%
		 	}else{
		 %>
		 <ul class="nav navbar-nav navbar-right">
		  <li class="dropdown">
		   <a href="#" class="dropdown-toggle"
		   	data-toggle="dropdown" role="button" aria-haspopup="true"
		   	aria-expanded="false"><%=id %>님 환영합니다.<span class="caret"></span>
		   </a>
		   <ul class="dropdown-menu">
		   	<li><a href="logoutAction.jsp">로그아웃</a></li>
		   	<li><a href="modifyForm.jsp">회원정보수정</a></li>
		   	<li><a href="deleteForm.jsp">회원탈퇴</a></li>
		   </ul>
		  </li>
		 </ul>
		 <%
		 	}
		 %>
		</div>
	</nav>
</body>
</html>