<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	session.setAttribute("STUDENT", "AR");
	session.setAttribute("NAME", "AR삽질러");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Save</title>
</head>
<body>
<h1>Session Info Save</h1>
<HR>
세션에 정보를 저장하였습니다.
</body>
</html>