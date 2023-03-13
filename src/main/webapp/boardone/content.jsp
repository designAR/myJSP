<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardone.BoardDAO" %>
<%@ page import="boardone.BoardVO" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/custom.css">
	<title>글내용보기</title>
	<script type="text/javascript" src="script.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</head>
<%
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	try{
		BoardDAO dbPro = BoardDAO.getInstance();
		BoardVO article = dbPro.getArticle(num);
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
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
	  <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #ddddddd">
	   <thead>
	    <tr>
	     <th colspan="4"><h4>글내용</h4></th>
	    </tr>
		<tbody>
		
		<tr>
	      <td style="width:125px;" align="center"><h5>글번호</h5></td>
	      <td style="width:125px;" align="center"><h5><%=article.getNum() %></h5></td>
	      <td style="width:125px;" align="center"><h5>조회수</h5></td>
	      <td style="width:125px;" align="center"><h5><%=article.getReadcount() %></h5></td>
	    </tr>
	    <tr>
	      <td align="center" style="width:125px;" align="center"><h5>작성자</h5></td>
	      <td align="center" style="width:375px;"><h5><%=article.getWriter() %></h5></td>
	      <td align="center"style="width:125px;"><h5>작성일</h5></td>
	      <td align="center" style="width:125px;"><h5><%=article.getRegdate() %></h5></td>
	    </tr>
	    <tr>
	      <td align="center" style="width:125px;" align="center"><h5>글제목</h5></td>
	      <td align="center" style="width:375px;" colspan="3"><h5><%=article.getSubject() %><h5></td>
	    </tr>
	    <tr>
	      <td align="center" style="width:125px;"><h5>글내용</h5></td>
	      <td align="left" style="width:375px;" colspan="3"><h5><%=article.getContent() %></h5></td>
	    </tr>
	    
	    <tr>
			<td colspan="4" align="center">
			<input class="btn btn-primary" type="button" value="게시글 수정" onClick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-primary" type="button" value="게시글 삭제" onClick="document.location.href='deleteForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-primary" type="button" value="게시글 답글" onClick="document.location.href='writeForm.jsp?num=<%=num %>&ref=<%=ref %>&step=<%=step %>&depth=<%=depth %>'">&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-primary" type="button" value="게시글 목록" onClick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
			</td>		
		</tr>		
	</tbody>
	
	<%
		}catch(Exception e){}
	%>
	  </thead>
	 </table>
	</div>
</body>
</html>