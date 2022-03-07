<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>게시판 작성</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
</style>
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
		<p>리뷰 작성하기</p>
	</div>
	


	<form action="/boardprocess" method="post"
		enctype="multipart/form-data">
		<div>
			<p>
				제목 : <input type="text" name="bTitle">
		</div>


		<div>
			<textarea rows="10" cols="50" name="bContent"
				placeholder="내용을 입력하세요."></textarea>

		</div>
		<hr>

		<select name="p_idx" class="p_idx">
			<option value="0" selected>후기를 작성할 구입했던 제품을 선택하세요</option>
			<c:forEach var="buy" items="${buyList}">

				<option value="${buy.p_idx}">${buy.p_name },${buy.s_name },${buy.co_name }</option>

			</c:forEach>
		</select>
		<p>
		<p>
		<td><input type="file" name="files" multiple="multiple"></td>
		<p>
		<button type="submit" class="btn btn-success btn-sm">작성</button>
		<hr>


	</form>

	<div>
		<a href="/" class="btn btn-danger" role="button">돌아가기</a>
	</div>
</body>
</html>