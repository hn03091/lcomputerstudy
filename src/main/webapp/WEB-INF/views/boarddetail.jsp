<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

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
		<p>게시판 상세보기</p>
	</div>

	<title>게시판 내용</title>
</head>

<body>

	<div>
		<c:forEach var="boardFile" items="${board.boardFiles }">
			<p>
				<img src="/image/thumb/${boardFile.fileName }">
			</p>


		</c:forEach>
	</div>

	<dl class="dl-horizontal">
		<dt>게시판 제목 : ${board.bTitle}</dt>
		<dd>등록 날짜 : ${board.bDateTime}</dd>
		<dd>작성자 : ${board.bWriter }</dd>
		<dd>내용 : ${board.bContent }</dd>

	</dl>
	<sec:authentication property="principal" var="user" />


	<form action="/commentprocess" method="post">
		<input type="hidden" name="bId" value="${board.bId}">
		<div>
			댓글 작성 :
			<textarea rows="1" cols="40" name="c_content"
				placeholder="내용을 입력하세요."></textarea>
			<button type="submit">댓글작성</button>

		</div>
		
	</form>


	<c:if test="${user.uName  == board.bWriter }">

		<form action="/boardUpdate" method="post">
			<input type="hidden" name="bId" value="${board.bId}">
			<button type="submit" class="btn btn-success btn-lg">수정</button>
		</form>
	</c:if>
	<p>
	<c:if
		test="${user.uName  == board.bWriter || user.authorities == '[ROLE_ADMIN, ROLE_USER]' }">
		<form action="/boardDelete" method="post">
			<input type="hidden" name="bId" value="${board.bId}">
			<button type="submit" class="btn btn-danger">삭제</button>
		</form>
	</c:if>


	<div style="OVERFLOW-Y: auto; width: 100%; height: 500px;">
		<table class="table table-hover">



			<tr>
				<th>댓글번호</th>
				<th>내용</th>
				<th>작성자</th>
				<th>날짜</th>
			</tr>

			<c:forEach var="comment" items="${board.comments}">
				<tr>
					<td>${comment.c_no}</td>
					<td>${comment.c_content}</td>
					<td>${comment.c_writer}</td>
					<td>${comment.c_date }</td>
					<c:if
						test="${user.uName  == comment.c_writer || user.authorities == '[ROLE_ADMIN, ROLE_USER]' }">
						<td><a href="/commentDelete?c_no=${comment.c_no}"class="btn btn-danger" role="button">삭제</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>






	</table>

</body>
</html>