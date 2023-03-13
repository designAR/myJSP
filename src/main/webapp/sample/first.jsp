<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Test</title>
</head>
<body>
<c:if test="${3 > 4 }">
이 내용은 화면에 나타나지 않습니다.
</c:if>

<c:if test="${param.type eq 'guest' }">
<h1>홈페이지 방문을 환영합니다.</h1><br>
짝 짝 짝 짝 짝 짝 짝 짝
</c:if>

<c:if test="${param.type eq 'member' }">
<h1>회원님의 방문을 환영합니다.</h1><br>
쿵 쿵 쿵 쿵 쿵 쿵 쿵 쿵
</c:if>

</body>
</html>