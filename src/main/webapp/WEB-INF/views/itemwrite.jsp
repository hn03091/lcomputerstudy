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
	<font size="5em" color="green"> 상품 등록 </font>
	<hr>
	<form action="/itemwriteProcess" method="post" enctype="multipart/form-data">
		<div>
			<p>
				상품명 : <input type="text" name="i_name">
			
		</div>
		
	
		<c:forEach var="itemList" items="${itemList }">
			<td>${itemList.i_idx}</td>
			<td>${itemList.i_name }</td>
			<p>
		</c:forEach>
		
		<p>	분류코드 : <input type="text" name="i_idx">
		<hr></hr>
		
		<div>
			<textarea rows="10" cols="50" name="i_content"
				placeholder="상품 설명을 입력하세요"></textarea>

		</div>

		<p>
			<input type="file" name="files" multiple="multiple">
		</p>

		<button type="submit">작성</button>
		<hr>
		<a href="/itemList">돌아가기</a>

	</form>

</body>
<script>


</script>
</html>