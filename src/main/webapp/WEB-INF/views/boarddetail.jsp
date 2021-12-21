<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
a {
	text-devcoration: none;
	color: #000;
	font-weight: 700;
	border: none;
	cursor: pointer;
	padding: 10px;
	display: inline-block;
}
</style>
<style>
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
</style>

<title>게시판 내용</title>
</head>

<body>
	<p>게시판 제목 : ${board.bTitle}</p>
	<p>등록 날짜 : ${board.bDateTime}</p>
	<p>작성자 : ${board.bWriter }</p>
	<p>내용 : ${board.bContent }</p>
	<sec:authentication property="principal" var="user" />
	

	<form action="/commentprocess" method="post">
		<input type="hidden" name="bId" value="${board.bId}">
		<div>
			댓글 작성 :
			<textarea rows="1" cols="40" name="c_content"
				placeholder="내용을 입력하세요."></textarea>
			<button type="submit">댓글작성</button>

		</div>
		<ul>
			<li><a href="/">돌아가기</a></li>
		</ul>
	</form>

	<div>
		<c:forEach var="boardFile" items="${board.boardFiles }">
			<p>
				<img src="/image/thumb/${boardFile.fileName }">
			</p>


		</c:forEach>
	</div>

	<c:if test="${user.uName  == board.bWriter }">

		<form action="/boardUpdate" method="post">
			<input type="hidden" name="bId" value="${board.bId}">
			<button type="submit">수정</button>
		</form>
	</c:if>
	<c:if
		test="${user.uName  == board.bWriter || user.authorities == '[ROLE_ADMIN, ROLE_USER]' }">
		<form action="/boardDelete" method="post">
			<input type="hidden" name="bId" value="${board.bId}">
			<button type="submit">삭제</button>
		</form>
	</c:if>



	<table>



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
					<td><a href="/commentDelete?c_no=${comment.c_no}">삭제</a></td>
				</c:if>
			</tr>
		</c:forEach>






	</table>

</body>
</html>