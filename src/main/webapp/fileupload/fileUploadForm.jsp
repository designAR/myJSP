<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
<form action="fileupload.jsp" method="post" enctype="multipart/form-data">
<table border=1>
	<tr>
	 <td colspan=2 align=center><h3>파일 업로드</h3></td>
	</tr>
	<tr>
	 <td>Upload : </td><td><input type="text" name="name"></td>
	</tr>
	<tr>
	 <td>Title : </td><td><input type="text" name="subject"></td>
	</tr>
	<tr>
	 <td>FileName1 : </td><td><input type="file" name="filename1"></td>
	</tr>
	<tr>
	 <td>FileName2 : </td><td><input type="file" name="filename2"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
		<input type="submit" value="전송"></td>
	</tr>
</table>
</form>
</body>
</html>