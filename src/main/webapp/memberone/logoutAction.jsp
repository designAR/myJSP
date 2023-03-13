<%@page import="memberone.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = MemberDAO.getInstance();
%>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인아웃처리</title>
</head>
<body>
	<%session.invalidate(); %>
	<script type="text/javascript">
		location.href = 'main.jsp';
	</script>
</body>
</html>