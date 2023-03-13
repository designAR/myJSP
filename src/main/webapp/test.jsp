<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.InitialContext, javax.naming.Context"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	InitialContext initCtx = new InitialContext();
	Context envContext = (Context) initCtx.lookup("java:/comp/env");
	DataSource ds = (DataSource) envContext.lookup("jdbc/member");
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select version(); ");
	while(rs.next()){
		out.println("Oracle Version : " + rs.getString("version()"));
	}
	rs.close();
	stmt.close();
	conn.close();
	initCtx.close();
%>
</body>
</html>