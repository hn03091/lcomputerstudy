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
	<p>게시판 제목 : ${product.p_name}</p>
	<p>등록 날짜 : ${product.p_date}</p>
	<p>가격 : ${product.p_price}
	<p>내용 : ${product.p_content }</p>
	<sec:authentication property="principal" var="user" />


	<div>
		<c:forEach var="boardFile" items="${product.boardFiles }">
			<p>
				<img src="/image/thumb/${boardFile.fileName }">
			</p>


		</c:forEach>
	</div>
	<form action="/productBuy" method="post">
		<select name="size">
			<option value="none">=== size ===</option>
			<option value="S">S</option>
			<option value="M">M</option>
			<option value="L">L</option>
			<option value="XL">XL</option>
		</select>
		<p>
		<select name="color">
			<option value="none">=== color===</option>
			<option value="red">red</option>
			<option value="blue">blue</option>
			<option value="black">black</option>
			<option value="white">white</option>
		</select>

		<hr>
		<button type="submit">구매하기</button>
		<hr>
	</form>
	<ul>

		<li><a href="/productList?i_idx=${$product.i_idx }">돌아가기</a></li>
		<li><a href="/boardList?p_idx=${product.p_idx }">제품 후기 게시판</a>
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