<%@page import="memberone.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
	MemberDAO dao = MemberDAO.getInstance();
%>
<jsp:useBean id="vo" class="memberone.MemberVO"/>
<jsp:setProperty name="vo" property="*"/>
<%
	String id = (String)session.getAttribute("id");
	vo.setId(id);
	dao.updateMember(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정완료</title>
<link href="style.css" rel="stylesheet" type="text/css">
<body bgcolor="#FFFFCC">
</head>
<body>
<center>
	<font size="5" face="바탕체">
		
		<br><h3>회원정보가 수정되었습니다.</h3>
		<%
		out.println("<a href=login.jsp>로그인</a>");
		%>
	</font>
</center>
</body>
</html>