<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<h1>게시판 수정</h1>
<p>게시판 제목 : ${data.bTitle}</p>
	<p>등록 날짜 : ${data.bDateTime}</p>
	<p>작성자 : ${data.bWriter }</p>
	<p>내용 : ${data.bContent }</p>
	
<form action="/updateProcess" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bId" value="${board.bId}">
 	
 	 <div>
 		<p> 제목 : <input type="text" name="bTitle">
 	 </div>
 	 
 	<div>
		<textarea rows="10" cols="50" name="bContent" placeholder="내용을 입력하세요."></textarea>
		
	</div>
	   <td><input type="file" name="files" multiple="multiple"></td>
	<button type="submit">작성</button>	
	
		
</form>

<c:forEach var="file" items="${data.boardFiles}" varStatus="status">
	<img src="/image/thumb/${file.fileName }">
	<p><a href="/fileDelete?bfIdx=${file.bfIdx}">삭제</a></p>

</c:forEach>

<div>
	<ul>
		<li><a href="/">돌아가기</a></li>
	</ul>
</div>	
</body>
</html>