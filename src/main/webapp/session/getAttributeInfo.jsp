<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String Studentid = (String)session.getAttribute("STUDENT");
	String name = (String)session.getAttribute("NAME");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Info GET</title>
</head>
<body>
<h1>세션 정보 로드</h1>
<HR>
StudentID : <%=Studentid %><br>
Name : <%=name %>
</body>
</html>