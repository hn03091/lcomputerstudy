<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="pd" items="${prList}">
<div>

상품명 : ${pd.p_name}
가격 : ${pd.p_price}
등록 날짜 : ${pd.p_date}
<a href="/itemdetail?p_idx=${pd.p_idx }">상세보기</a> ////
<a href="/boardList?p_idx=${pd.p_idx }">제품 후기보기</a>

</div>
</c:forEach>
<a href="/">돌아가기</a>
</body>
</html>