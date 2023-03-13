<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/custom.css">
	<title>메인페이지</title>
	<script type="text/javascript" src="script.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");

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
		 <%
		 	if(id == null){
		 %>
		 <ul class="nav navbar-nav navbar-right">
		  <li class="dropdown">
		   <a href="#" class="dropdown-toggle"
		   	data-toggle="dropdown" role="button" aria-haspopup="true"
		   	aria-expanded="false">접속하기<span class="caret"></span>
		   </a>
		   <ul class="dropdown-menu">
		   	<li><a href="login.jsp">로그인</a></li>
		   	<li><a href="regForm.jsp">회원가입</a></li>
		   </ul>
		  </li>
		 </ul>
		 <%
		 	}
		 %>
		 
		</div>
	</nav>
	
	<div class="container">
	 <form method="post" action="regProc.jsp" name="regForm">
	  <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #ddddddd">
	   <thead>
	    <tr>
	     <th colspan="3"><h4>회원등록양식</h4></th>
	    </tr>
	   </thead>
	    <tbody>
	     <tr>
	      <td style="width:110px;"><h5>아이디</h5></td>
	      <td><input class="form-control" type="text" id="id" name="id" maxlength="20" placeholder="아이디를 입력하세요.">
	      <td style="width: 110px;"><button class="btn btn-primary" onClick="idCheck(this.form.id.value);" type="button">중복체크</button></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>비밀번호</h5></td>
	      <td class="2"><input onkeyup="passwordCheckFunction();" class="form-control" id="userPassword1" type="password" name="pass" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>비밀번호 확인</h5></td>
	      <td class="2"><input onkeyup="passwordCheckFunction();" class="form-control" id="userPassword12" type="password" name="repass" maxlength="20" placeholder="비밀번호확인를 입력하세요."></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>이름</h5></td>
	      <td class="2"><input class="form-control" id="userName" type="text" name="name" maxlength="20" placeholder="이름를 입력하세요."></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>전화번호</h5></td>
	      <td style="text-align: left;">
	       <select name="phone1">
	        <option value="02">02</option>
	        <option value="010">010</option>
	        <option value="011">011</option>
	        <option value="016">016</option>
	        <option value="017">017</option>
	        <option value="018">018</option>
	        <option value="019">019</option>
	       </select> -
	       <input type="text" name="phone2" size="8" /> -
	       <input type="text" name="phone3" size="8" />
	      </td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>나이</h5></td>
	      <td class="2"><input class="form-control" id="age" type="number" name="age" maxlength="20" placeholder="나이를 입력하세요."></td>
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
	      <td><input class="form-control" type="text" name="email" maxlength="20" placeholder="이메일를 입력하세요."></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>우편번호</h5></td>
	      <td><input class="form-control" type="text" name="zipcode" maxlength="20" placeholder="우편번호를 입력하세요">
		  <td style="width: 110px;"><button class="btn btn-primary" onClick="zipCheck()" type="button">찾기</button></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>주소1</h5></td>
	      <td><input class="form-control" type="text" name="address1" size="50" placeholder="주소를 입력하세요."></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>주소2</h5></td>
	      <td><input class="form-control" type="text" name="address2" size="30" placeholder="상세주소를 입력하세요."></td>
	     </tr>
	     <tr>
	      <td style="width:110px;"><h5>프로필</h5></td>
	      <td><input class="form-control" type="text" name="profile" size="30" placeholder="프로필 사진을 등록하세요."></td>
	      <td style="width: 110px;"><button class="btn btn-primary" onClick="#" type="button">사진찾기</button></td>
	     </tr>
	     <tr>
			<td colspan="2" align="center">
			<input class="btn btn-primary" type="button" value="회원가입" onClick="inputCheck()"/>&nbsp;&nbsp;
			<input class="btn btn-primary" type="reset" value="다시입력">
			</td>
			
		</tr>				
  			</tbody>
  		</table>
	</form>
  </div>
    
</body>
</html>
