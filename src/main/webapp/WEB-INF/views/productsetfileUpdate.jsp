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
	<form action="/productsetfileUpdateProcess" method="post"
		enctype="multipart/form-data">
		<c:forEach var="file" items="${fileList}">
			<img src="/image/thumb/${file.fileName }">
			<a href="/productfileDelete/?bfIdx=${file.bf_idx }" target='_blank'>해당이미지
				삭제하기</a>
			<input type="hidden" name="p_idx" value="${file.p_idx}">
			<hr>
			<input type="file" name="files" multiple="multiple">
			<p>
				<button type="submit">새로운 이미지 등록</button>
			<hr>
		</c:forEach>

	</form>

</body>
</html>