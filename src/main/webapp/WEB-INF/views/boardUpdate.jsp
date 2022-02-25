<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<style>
</style>
<title>Insert title here</title>
</head>
<body role="document">
	<!-- 상단메뉴 -->
	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">

		<a class="navbar-brand" href="/">BEOM SHOP</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<li class="dropdown"><a href="/" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">의류 <span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">


						<c:forEach var="itemList" items="${itemList }">
							<c:set var="Idx" value="${fn:length(itemList.i_idx) }" />
							<c:choose>
								<c:when test="${Idx == '2' }">
									<li class="divider"></li>
									<li class="dropdown-header"><hr></li>

									<li><a href="/productList?i_idx=${itemList.i_idx}">${itemList.i_name }
									</a></li>
									<li class="divider"></li>
									<li class="dropdown-header">------${itemList.i_name}------</li>
								</c:when>
								<c:when test="${Idx != '2' }">
									<li><a href="/productList?i_idx=${itemList.i_idx}">${itemList.i_name }</a></li>
								</c:when>
							</c:choose>


							<p>
						</c:forEach>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="/boardList">후기게시판</a></li>

				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">문의</a></li>
			</ul>

		</div>
	</nav>
	<!-- 상단메뉴 -->
	<div class="jumbotron">
		<h1>Review Board</h1>
		<p>게시판 수정</p>
	</div>

	
</head>


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