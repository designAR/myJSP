<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/custom.css">
	<title>글수정</title>
	<script type="text/javascript" src="script.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</head>
<script language="JavaScript">
<!--
 function deleteSave(){
	if(document.delForm.pass.value==""){
		alert("비밀번호를 입력해주세요!");
		document.delForm.pass.focus();
		return false;
	}
}
-->
</script>
<body>
	<%
		String id = (String)session.getAttribute("id");
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
		 <a class="navbar-brand" href="../memberone/main.jsp">AR 웹페이지</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		 <ul class="nav navbar-nav">
		  <li class="active"><a href="../memberone/main.jsp">메인</a>
		   <li class="active"><a href="list.jsp">게시판</a>
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
		   	<li><a href="../memberone/login.jsp">로그인</a></li>
		   	<li><a href="../memberone/regForm.jsp">회원가입</a></li>
		   </ul>
		  </li>
		 </ul>
		 <%
		 	}
		 %>
		</div>
	</nav>
<div class="container">
	 <form method="post" name="delForm" action="deleteProc.jsp?pageNum=<%=pageNum %>" onsubmit="return deleteSave()">
	  <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #ddddddd">
	   <thead>
	    <tr height="30">
	     <th align="center">
	      <h4>비밀번호를 입력해 주세요</h4></th>
	    </tr>
	   </thead>
	    <tbody>
	    <tr height="30">
	      <td style="width:110px;">비밀번호 :
	      <input class="form-controlnum" type="password" name="pass" size="25" maxlength="12" placeholder="비밀번호를 입력하세요.">
	      <input type="hidden" name="num" value="<%=num %>"></td>
	     </tr>
	     
	 	
		<tr height="30">
			<td style="width:110px;">
			<input class="btn btn-primary" type="submit" value="글삭제"/>&nbsp;&nbsp;
			<input class="btn btn-primary" type="button" value="글목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>
		</tbody>
	 </table>
	 </form>
</div>
</body>
</html>