<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>Insert title here</title>
</head>
<body>

	<table>

		<tr>
			<th>게시판 번호</th>
			<th>게시판 제목</th>
			<th>게시판 작성자</th>
			<th>게시판 작성일</th>
			<th>리뷰 제품</th>
			<th>제품 상세보기</th>
		</tr>

		<c:forEach var="rv" items="${rvList }">
			<tr>
				<td>${rv.bId }</td>
				<td> ${rv.bTitle }</td>
				<td>${rv.bWriter }</td>
				<td>${rv.bDateTime }</td>
				<td><a href="/boarddetail?bId=${rv.bId}">${rv.p_name}</a></td>
				<td><a href="/itemdetail?p_idx=${rv.p_idx }">제품 상세보기</a></td>
				
			</tr>
		</c:forEach>

	</table>
	
</body>
</html>