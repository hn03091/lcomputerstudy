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
        <h1>Beom Shop</h1>
        <p> 제품 상세보기</p>
      </div>
      
      <div>
		<c:forEach var="boardFile" items="${product.boardFiles }">
			<p>
				<img src="/image/thumb/${boardFile.fileName }">
			</p>


		</c:forEach>
	</div>
	<hr>
	<dl class="dl-horizontal">
		<dt>제품명 : ${product.p_name}</dt><p>
		<dd>등록 날짜 : ${product.p_date}</dd>
		<dd>가격 : ${product.p_price}원</dd>
		<dd>제품 설명 : ${product.p_content }</dd>
		</dl>
	<sec:authentication property="principal" var="user" />



		<hr>
		

	<ul>

		<li><a href="/itembuy?p_idx=${product.p_idx }" class="btn btn-success btn-sm" role="button">구매하기</a></li>
		<p>
		<li><a href="/boardList?p_idx=${product.p_idx }" class="btn btn-info btn-sm" role="button">제품 후기 게시판</a>
	</ul>

	<!-- <form action="/commentprocess" method="post">
		<input type="hidden" name="p_idx" value="${product.p_idx}">
		<div>
			댓글 작성 :
			<textarea rows="1" cols="40" name="c_content"
				placeholder="내용을 입력하세요."></textarea>
			<button type="submit">댓글작성</button>

		</div>
		
	</form>
	





 	<table>



		<tr>
			<th>댓글번호</th>
			<th>내용</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>

		<c:forEach var="comment" items="${item.comments}">
			<tr>
				<td>${comment.c_no}</td>
				<td>${comment.c_content}</td>
				<td>${comment.c_writer}</td>
				<td>${comment.c_date }</td>
				<c:if
					test="${user.uName  == comment.c_writer || user.authorities == '[ROLE_ADMIN, ROLE_USER]' }">
					<td><a href="/commentDelete?c_no=${comment.c_no}">삭제</a></td>
				</c:if>
			</tr>
		</c:forEach>

	</table> -->
	
	
</body>
</html>