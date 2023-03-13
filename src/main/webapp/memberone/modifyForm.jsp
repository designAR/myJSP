<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="memberone.*" %>    
<%
	MemberDAO dao = MemberDAO.getInstance();
%>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/custom.css">
	<title>회원정보수정</title>
	<script type="text/javascript" src="script.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	
	
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		MemberVO vo = dao.getMember(id);
		
	%>
	<nav class="navbar navbar-default">
	 <div class="navbar-header">
	  <button type="button" class="navbar-toggle collapsed"
	  	data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
	  	aria-expanded="false">
		 	<span class="icon-bar"></span>
		 	<span class="icon-bar"></span>
		 	<span class="icon-bar"></span>
		 </button>
		 <a class="navbar-brand" href="main.jsp">AR 웹페이지</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		 <ul class="nav navbar-nav">
		  <li class="active"><a href="main.jsp">메인</a>
		   <li class="active"><a href="../boardone/list.jsp">게시판</a>
		 </ul>
		
		 <ul class="nav navbar-nav navbar-right">
		  <li class="dropdown">
		   <a href="#" class="dropdown-toggle"
		   	data-toggle="dropdown" role="button" aria-haspopup="true"
		   	aria-expanded="false"><%=id %>님 환영합니다.<span class="caret"></span>
		   </a>
		   <ul class="dropdown-menu">
		   	<li><a href="logoutAction.jsp">로그아웃</a></li>
		   	<li><a href="#">회원정보수정</a></li>
		   	<li><a href="#">회원탈퇴</a></li>
		   </ul>
		  </li>
		 </ul>
		
		 
		</div>
	</nav>
	
	<div class="container">
	 <form name="regForm" method="post" action="modifyProc.jsp">
	  <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #ddddddd">
	   <thead>
	    <tr>
	     <th colspan="3"><h4>회원 수정 정보 입력</h4></th>
	    </tr>
	   </thead>
	    <tbody>
	     <tr>
	      <td style="width:110px;"><h5>아이디</h5></td>
	      <td><h5><%=vo.getId() %></h5>
	      <input type="hidden" name="id" value="vo.getId()%>"></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>비밀번호</h5></td>
	      <td class="2"><input onkeyup="passwordCheckFunction();" class="form-control" id="userPassword1" type="text" name="pass" maxlength="20" placeholder="비밀번호확인를 입력하세요." value="<%=vo.getPass()%>"></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>비밀번호 확인</h5></td>
	      <td class="2"><input onkeyup="passwordCheckFunction();" class="form-control" id="userPassword12" type="text" name="repass" maxlength="20" placeholder="비밀번호확인를 입력하세요." value="<%=vo.getPass()%>"></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>이름</h5></td>
	      <td class="2"><input class="form-control" id="userName" type="text" name="name" maxlength="20" placeholder="이름를 입력하세요." value="<%=vo.getName()%>"></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>전화번호</h5></td>
	      <td style="text-align: left;">
	       <input type="text" name="phone1" size="8" value="<%=vo.getPhone1()%>"/> -
	       <input type="text" name="phone2" size="8" value="<%=vo.getPhone2()%>"/> -
	       <input type="text" name="phone3" size="8" value="<%=vo.getPhone3()%>"/>
	      </td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>나이</h5></td>
	      <td class="2"><input class="form-control" id="age" type="number" name="age" maxlength="20" placeholder="나이를 입력하세요." value="<%=vo.getAge()%>"></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>성별</h5></td>
	      <td colspan="2" >
	       <div class="form-group" style="text-align: center; margin: 0 auto;">
	        <div class="btn-group" data-toggle="buttons">
	         <label class="btn btn-primary active">
	          <input type="radio" name="gender" autocomplete="off" value="남자" checked>남자
	         </label>
	         <label class="btn btn-primary">
	          <input type="radio" name="gender" autocomplete="off" value="여자">여자
	         </label>
	        </div>
	       </div>
	      </td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>이메일</h5></td>
	      <td><input class="form-control" type="text" name="email" maxlength="20" placeholder="이메일를 입력하세요." value="<%=vo.getEmail()%>"></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>우편번호</h5></td>
	      <td><input class="form-control" type="text" name="zipcode" maxlength="20" placeholder="우편번호를 입력하세요" value="<%=vo.getZipcode()%>">
		  <td style="width: 110px;"><button class="btn btn-primary" onClick="zipCheck()" type="button">찾기</button></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>주소1</h5></td>
	      <td><input class="form-control" type="text" name="address1" size="50" placeholder="주소를 입력하세요." value="<%=vo.getAddress1()%>"></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>주소2</h5></td>
	      <td><input class="form-control" type="text" name="address2" size="30" placeholder="상세주소를 입력하세요." value="<%=vo.getAddress2()%>"></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>프로필</h5></td>
	      <td><input class="form-control" type="text" name="profile" size="30" placeholder="프로필 사진을 등록하세요." value="<%=vo.getProfile()%>" ></td>
	      <td style="width: 110px;"><button class="btn btn-primary" onClick="#" type="button">사진찾기</button></td>
	     </tr>
	     <tr>
			<td colspan="2" align="center">
			<input class="btn btn-primary" type="button" value="정보수정" onClick="updateCheck()"/>&nbsp;&nbsp;
			<input class="btn btn-primary" type="reset" value="다시입력">
			</td>
			<td style="text-align: left;" colspan="3"><h5 style="color: red;" id="passwordCheckMessage"></h5>   
		</tr>				
  			</tbody>
  		</table>
	</form>
  </div>
</body>
</html>
