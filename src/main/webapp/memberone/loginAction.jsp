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
	<title>로그인처리</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		int check = dao.loginCheck(id, pass);
	%>
	<%
	if(check == 1){ // 로그인 성공시
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
	}else if(check == 0){ // 아이디존재 비밀번호 오류
	%>
	<script type="text/javascript">
		alert("비밀번호 오류!");
		history.go(-1);
	</script>
	<%}else{ // 아이디 자체가 존재하지 않는 경우
	%>
		<script type="text/javascript">
			alert("아이디가 존재하지 않습니다.");
			history.go(-1);
		</script>
	<%} %>
</body>
</html>