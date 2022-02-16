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
	<font size="5em" color="green"> 상품 수정 </font>
	<hr>
	<p>
			<img src="/image/thumb/${product.fileName }">
		</p>
		${product.bf_idx }
				
				<button id="btn_add" value="${product.bf_idx }" onclick="window.open('productfiledelete','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">이미지 파일 삭제</button>
		

	
		<hr>
	
	<form action="/productsetUpdateProcess" method="post" enctype="multipart/form-data">
		<div>
			<p>
				상품명 : <input type="text" name="p_name" placeholder="${product.p_name }">
			
		</div>
		
	
		
		
		
			<p>대분류코드</p>
			<td>${product.i_idx}</td>
			<td>${product.i_name }</td>
			
		<p> 중분류코드 : 
			<td>${product.m_idx}</td>
			<td>${product.m_name }</td>
			<p>
				
		<p> 상품코드 : <input type="text" name="p_idx" placeholder="${product.p_idx }" disabled/>
		<input type="hidden" name="p_idx" value="${product.p_idx}">
		<p> 상품가격 : <input type="text" name="p_price" placeholder="${product.p_price }"> 원
		<hr></hr>
		
		<div>
			<textarea rows="10" cols="50" name="p_content"
				placeholder="${product.p_content }"></textarea>

		</div>
	
		<p>
			<input type="file" name="files" multiple="multiple">
		</p>
		<button type="submit">작성</button>
		</form>
		<hr>
		
		<a href="/productset">돌아가기</a>

	

</body>
<script>
$(document).on('click', '#btn_add', function () {
    $(this).before(q_tag);

    alert("삭제완료");
    
  });

</script>
</html>