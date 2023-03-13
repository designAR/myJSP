<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("name", URLEncoder.encode("AR삽질러", "utf-8"));
	response.addCookie(cookie);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키생성하기</title>
</head>
<body>
<h1>Cookie Example</h1>
<HR>
쿠키의 이름 = <%=cookie.getName() %><br>
쿠키의 값 = <%=cookie.getValue()%>
</body>
</html>