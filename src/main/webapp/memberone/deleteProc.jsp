<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="memberone.*" %>
<%
	MemberDAO dao = MemberDAO.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 완료</title>
<link href="style.css" rel="stylesheet" type="text/css">
<% 
	String id = (String)session.getAttribute("id");
	String pass = request.getParameter("pass");
	int flag = dao.deleteMember(id, pass);
	if(flag == 1){
		session.invalidate();
%>
<body bgcolor="#FFFFCC">
<center>
	<font size="5" face="바탕체">
		
		<br><h3>회원탈퇴가 되었습니다.</h3>
		<h3>그동안 ARService를 이용해주셔서 감사합니다.</h3>
		<a href=main.jsp>ARService</a>
	</font>
</center>
	<%}else{ %>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다!");
		history.go(-1);
	</script>	
	<%} %>
</body>
</html>