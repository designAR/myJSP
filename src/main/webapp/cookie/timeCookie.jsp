<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Cookie cookie = new Cookie("hour", "1time");
    	cookie.setMaxAge(60); // 60초
    	response.addCookie(cookie);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 유효시간</title>
</head>
<body>
<h1>유효시간이 1시간 hour쿠키 생성</h1>
</body>
</html>