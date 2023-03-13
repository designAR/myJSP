<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardone.BoardDAO" %>
<%@ page import="boardone.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

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
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try{
		BoardDAO dbPro = BoardDAO.getInstance();
		BoardVO article = dbPro.updateGetArticle(num);
%>
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
	 <form method="post" name="writeForm" action="updateProc.jsp?pageNum=<%=pageNum %>" onsubmit="return writeSave()">
	  <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #ddddddd">
	   <thead>
	    <tr>
	     <th colspan="3"><h4>게시판 글수정</h4></th>
	    </tr>
	   </thead>
	    <tbody>
		<tr>
	      <td align="right"  colspan="2" style="width:110px;">
		  <a href="writeForm.jsp"><h5>글목록</h5></a>
		  </td>      
	     </tr>
	 	<tr>
	      <td style="width:110px;"><h5>작성자</h5></td>
	      <td><input class="form-control" type="text" name="writer" maxlength="12" value="<%=article.getWriter()%>">
	       <input type="hidden" name="num" value="<%=article.getNum() %>"></td>
	    </tr>
	  	<tr>
	      <td style="width:110px;"><h5>이메일</h5></td>
	      <td><input class="form-control" type="text" name="email" maxlength="30" value="<%=article.getEmail()%>">
	    </tr>
	    <tr>
	      <td style="width:110px;"><h5>제목</h5></td>
	      <td><input class="form-control" type="text" name="subject" maxlength="50" value="<%=article.getSubject()%>"></td>
	    </tr>
	    <tr>
	      <td style="width:70px;"><h5>내용</h5></td>
	      <td align="left"><textarea class="form-control" name="content" rows="13" cols="50"><%=article.getContent()%></textarea></td>
	    </tr>
	    <tr>
	      <td style="width:70px;"><h5>비밀번호</h5></td>
	      <td><input class="form-control" type="password" name="pass" size="8" maxlength="12" placeholder="비밀번호를 입력하세요.">
	     </tr>
	     <tr>
			<td colspan="2" align="center">
			<input class="btn btn-primary" type="submit" value="수정하기"/>&nbsp;&nbsp;
			<input class="btn btn-primary" type="reset" value="다시입력">&nbsp;&nbsp;
			<input class="btn btn-primary" type="button" value="목록" onClick="document.location.href='list.jsp?pageNum<%=pageNum%>'">
			</td>
		 </tr>	
	</tbody>	
	</table>		
  	</form>
  	</div>
    <%
	}catch(Exception e){}
    %>
</body>
</html>