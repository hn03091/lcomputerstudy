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
			<th>상품사진</th>
			<th>상품명</th>
			<th>가격</th>
			<th>등록 날짜</th>
			<th>제품 상세보기</th>
			<th>제품 후기보기</th>

		</tr>

		<c:forEach var="pd" items="${prList}">

			<tr>
				<td><img src="/image/thumb/${pd.fileName }" width="100" height="70"></td>
				<td>상품명 : ${pd.p_name}</td>
				<td>가격 : ${pd.p_price}</td>
				<td>등록 날짜 : ${pd.p_date}</td>
				<td><a href="/itemdetail?p_idx=${pd.p_idx }">상세보기</a></td>
				<td><a href="/boardList?p_idx=${pd.p_idx }">제품 후기보기</a></td>
			</tr>

		</c:forEach>

	</table>

	<a href="/">돌아가기</a>
</body>
</html>