<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename1 = request.getParameter("filename1");
	String filename2 = request.getParameter("filename2");
	String origfilename1 = request.getParameter("origfilename1");
	String origfilename2 = request.getParameter("origfilename2");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 확인</title>
</head>
<body>
Upload : <%=name %><br>
Title : <%=subject %><br>
Filename1 : <a href="/myWeb/upload/<%=filename1 %>"><%=origfilename1 %></a><br>
Filename2 : <a href="/myWeb/upload/<%=filename2 %>"><%=origfilename2 %></a><br>
</body>
</html>