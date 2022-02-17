<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.layer1 {
	display: none;
}
.layer2 {
	display: none;
}
.layer3 {
	display: none;
}
</style>
<body>
	<font size="200em" color="green"> Beom shop </font>
	<hr>
	<font size="5em" color="green"> 카테고리 등록 </font>
	<hr>
	대분류코드
	<p></p>
	<c:forEach var="item" items="${itemList}">
			<tr>
				
				<td>${item.i_idx}</td>
				<td>${item.i_name }</td>
				<p></p>
				

			</tr>
		</c:forEach>
		<hr>
	<form action="/itemsetwriteProcess" method="post" enctype="multipart/form-data">
		<div>
				분류코드 : <input type="text" name="i_idx"placeholder="10의 단위로 입력해주세요">
				<p></p>
				
				카테고리명 : <input type="text" name="i_name"placeholder="영어로 입력 해주세요">
		</div>
		<button type="submit">작성</button>
	
		<hr>
		
	
		<a href="/itemset">돌아가기</a>

	</form>

</body>
<script>

</script>
</html>