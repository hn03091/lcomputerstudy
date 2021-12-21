<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <style>
</style>
</head>
<body>

<h1>게시판 작성</h1>


<form action="/boardprocess" method="post" enctype="multipart/form-data">
 	 <div>
 		<p> 제목 : <input type="text" name="bTitle">
 	 </div>
 	 
 	<div>
		<textarea rows="10" cols="50" name="bContent" placeholder="내용을 입력하세요."></textarea>
		
	</div>
	   <td><input type="file" name="files" multiple="multiple"></td>
	<button type="submit">작성</button>	
	
		
</form>

<div>
	<ul>
		<li><a href="/">돌아가기</a></li>
	</ul>
</div>	
</body>
</html>