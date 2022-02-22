<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
ul, ol, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

ul.myMenu {
	
}

ul.myMenu>li {
	display: inline-block;
	width: 80px;
	padding: 5px 10px;
	background: #eee;
	border: 1px solid #eee;
	text-align: center;
	position: relative;
}

ul.myMenu>li:hover {
	background: #fff;
}

ul.myMenu>li ul.submenu {
	display: none;
	position: absolute;
	top: 30px;
	left: 0;
}

ul.myMenu>li:hover ul.submenu {
	display: block;
}

ul.myMenu>li ul.submenu>li {
	display: inline-block;
	width: 80px;
	padding: 5px 10px;
	background: #eee;
	border: 1px solid #eee;
	text-align: center;
}

ul.myMenu>li ul.submenu>li:hover {
	background: #fff;
}

<!--
////////
-->
table {
	border-collapse: collapse;
}

table tr th {
	font-weight: 700;
}

table tr td, table tr th {
	border: 1px solid #818181;
	width: 200px;
	text-align: center;
}

ul.button {
	width: 400px;
	height: 50px;
	margin: 10px auto;
}

li.button {
	list-style: none;
	width: 50px;
	line-height: 50px;
	border: 1px solid #ededed;
	float: left;
	text-align: center;
	margin: 0 5px;
	border-radius: 5px;
}
</style>
<body>
	<h1>BEOM SHOP</h1>
	

	<c:forEach var="itemList" items="${itemList }">
		<c:set var="Idx" value="${fn:length(itemList.i_idx) }" />
		<c:choose>
			<c:when test="${Idx == '2' }">				
				<ul><a href="/productList?i_idx=${itemList.i_idx}">${itemList.i_name } 대분류</a></ul>
			</c:when>
			<c:when test="${Idx != '2' }">
				<li><a href="/productList?i_idx=${itemList.i_idx}">${itemList.i_name } 중분류 </a></li>
			</c:when>
		</c:choose>

		<!-- 	<td><a href="/productList?i_idx=${itemList.i_idx}">${itemList.i_name }</a></td>
		 -->
		<p>
	</c:forEach>
	
	<table>
		<hr>
		<div>
			<form method="GET">
				<fieldset>
					<legend>글 검색</legend>
					<label>검색분류</label> <select name="type">
						<option value="b_title">제목</option>
						<option value="b_writer">작성자</option>
					</select> <label>검색어</label> <input type="text" name="keyword" value="" />
					<input type="submit" value="검색">
					<%--f(제목,작성자)=title&q=(검색내용) --%>
				</fieldset>
			</form>
		</div>

		<tr>
			<td>자유게시판 번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성 날짜</td>

		</tr>
		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.ROWNUM }</td>
				<td>${board.bTitle }</td>
				<td><a href="/boarddetail?bId=${board.bId}">${board.bWriter }</td>
				<td>${board.bDateTime }</td>

			</tr>
		</c:forEach>
	</table>
	<div>
		<ul class="button">
			<c:choose>
				<c:when test="${ page.prevPage  >=1 }">
					<li class="button" style=""><a
						href="/?nowpage=${page.prevPage}">◀</a></li>
				</c:when>
			</c:choose>

			<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}"
				step="1">
				<c:choose>
					<c:when test="${ page.nowpage == i }">

						<li class="button" style="background-color: #ededed;"><span>${i}</span></li>

					</c:when>
					<c:when test="${ page.nowpage != i }">
						<li class="button"><a href="/?nowpage=${i}">${i}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${ page.nextPage <= page.lastPage }">
					<li class="button" style=""><a
						href="/?nowpage=${page.nextPage}">▶</a></li>
				</c:when>
			</c:choose>
		</ul>
	</div>



	<hr>
	<div>
		<sec:authorize access="isAnonymous()">
			<a href="/login">로그인</a>
			<a href="/beforeSignUp">회원가입</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a href="/boardwrite">게시물 작성</a>
			<a href="/logout">로그아웃</a>
			<sec:authentication property="principal" var="principal" />
			<h2>${principal }</h2>
		</sec:authorize>

	</div>
	<div>
		<sec:authorize access="isAuthenticated()">
			<a href="/user/info">내 정보</a>
			<a href="/admin">관리자</a>
		</sec:authorize>
	</div>


</body>
</html>