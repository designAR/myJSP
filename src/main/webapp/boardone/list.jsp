<%@page import="org.apache.naming.HandlerRef"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardone.BoardDAO" %>
<%@ page import="boardone.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	int pageSize = 5; // 한페이지에서 볼수 있는 글수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0; 
	List<BoardVO> articleList = null;
	BoardDAO dbPro = BoardDAO.getInstance();
	count = dbPro.getArticleCount();
	if(count > 0){
		articleList = dbPro.getArticles(startRow, endRow);
	}
	number = count-(currentPage-1)*pageSize;
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/custom.css">
	<title>메인페이지</title>
	<script type="text/javascript" src="script.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</head>
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

<div class="container">
	  <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #ddddddd">
	   <thead>
	    <tr>
	     <th colspan="6"><h4>글목록(전체 글 : <%=count %>)</h4></th>
	    </tr>
	    <tr>
  		 <td colspan="6" align="right">
  		 <a href="writeForm.jsp"><h5>글쓰기</h5></a>
  	    </td>
	<%
		if(count == 0){
	%>
	<tbody>
     <tr>
      <td align="center"><h5>게시판에 저장된 글이 없습니다.</h5></td>
     </tr>
	</tbody>
	<%}else{ %>
	<tbody>
	     <tr>
	      <td align="center" style="width:50px;"><h5>번 호</h5></td>
	      <td align="center" style="width:250px;" width="250"><h5>제 목</h5></td>
  		  <td align="center" style="width:100px;" width="100"><h5>작성자</h5></td>
  		  <td align="center" style="width:150px;" width="150"><h5>작성일</h5></td>
  		  <td align="center" style="width:50px;" width="50"><h5>조회수</h5></td>
	     </tr>
	<%
		for(int i =0; i < articleList.size(); i++){
			BoardVO article = (BoardVO)articleList.get(i);
	%>
	<tr height="20">
      <td align="center" style="width:40px;"><h5><%=number--%></h5></td>
      <td width="200">
	 <!-- 5 -->
	 <%
	 	int wid=0;
	 	if(article.getDepth()>0){
	 		wid = 5 * (article.getDepth());
	 %>
		<img src="images/level.gif" width="<%=wid%>" height="16">
	 	<img src="images/re.gif">
	 <%}else{ %>
	 	<img src="images/level.gif" width="<%=wid%>" height="16">
	 <%} %>
	  <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
	 <%=article.getSubject()%></a>
	 <%if(article.getReadcount()>=10){ %>
	 	<img src="images/hot.gif"  border="0" height="16"><%}%></td>
	 <td align="center" width="100">
	 	<a href="mailto:<h5><%=article.getEmail()%>"></h5><h5><%=article.getWriter() %></h5></a></td>
	 <td align="center" width="150"><h5><%= sdf.format(article.getRegdate())%></h5></td>
	 <td align="center" width="50"><h5><%=article.getReadcount() %></h5></td>
	</tr>
		<%}%>
</tbody>
<%}%>
<tfoot>
<%
	if(count > 0){%>
		<tr>
        <td colspan="5" align="center">
        <%
		int pageBlock = 3;
		int imsi = count % pageSize == 0 ? 0 : 1;
		int pageCount = count / pageSize + imsi;
		int startPage = (int)((currentPage -1)/pageBlock)*pageBlock + 1;
		int endPage = startPage + pageBlock -1;
		if(endPage > pageCount) endPage = pageCount;
		if(startPage > pageBlock){ %>
		<a href="list.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
<%
		}
		for(int i = startPage; i <= endPage; i++){%>
		<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
<%
		}
		if(endPage < pageCount){%>
		<a href="list.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
		<%} %>
		</td>
		</tr>
<%
	}
%>		
</tfoot>
</div>	      
</body>
</html>