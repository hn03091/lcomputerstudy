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
	<font size="5em" color="green"> 카테고리 수정 </font>
	<hr>
	<form action="/itemsetwriteProcess" method="post" enctype="multipart/form-data">
		<div>
				<p>분류 코드 : ${item.i_idx }</p>
			

				카테고리명 : <input type="text" name="i_name"placeholder="${item.i_name }">
		</div>
		<button type="submit">수정</button>
	
		<hr>
		
	
		<a href="/itemset">돌아가기</a>

	</form>

</body>
<script>

</script>
</html>