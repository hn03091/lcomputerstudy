<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body role="document">
<!-- 상단메뉴 -->
	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
		
		<a class="navbar-brand" href="/">BEOM SHOP</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<li class="dropdown"><a href="/" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">의류 <span
						class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">


						<c:forEach var="itemList" items="${itemList }">
							<c:set var="Idx" value="${fn:length(itemList.i_idx) }" />
							<c:choose>
								<c:when test="${Idx == '2' }">
									<li class="divider"></li>
									<li class="dropdown-header"><hr></li>
								
									<li><a href="/productList?i_idx=${itemList.i_idx}">${itemList.i_name }
									</a></li>
									<li class="divider"></li>
									<li class="dropdown-header">------${itemList.i_name}------</li>
								</c:when>
								<c:when test="${Idx != '2' }">
									<li><a href="/productList?i_idx=${itemList.i_idx}">${itemList.i_name }</a></li>
								</c:when>
							</c:choose>


							<p>
						</c:forEach>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="/boardList">후기게시판</a></li>
		
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">문의</a></li>
			</ul>

		</div>
	</nav>
	<!-- 상단메뉴 -->
	   <div class="jumbotron">
        <h1>Beom Shop</h1>
        <p>주문서작성</p>
      </div>
	<p>상품명 : ${product.p_name }
	<p>상품 가격: ${product.p_price }원
	<input type="hidden" id="p_idx" value="${product.p_idx }">
	<hr>

		<select name="s_bank" class="form-control">
			<option value="0" selected>입금하실 은행을 선택하여주세요</option>
			<option value="1">신한</option>
			<option value="2">농협</option>
			<option value="3">국민</option>
		</select>
		<p class="sold">
			<textarea class="account" rows="1" cols="50" name="s_account"
				placeholder="계좌번호 입력"></textarea>
		</p>
		<p class="sold">
			<textarea class="address" rows="3" cols="50" name="s_address"
				placeholder="배송지 입력"></textarea>
		</p>
		<hr>
		<select name="s_size" class="form-control">
			<option value="0" selected>사이즈를 선택하여주세요</option>
			<option value="1">S</option>
			<option value="2">M</option>
			<option value="3">L</option>
			<option value="4">XL</option>

		</select>
		<p>
			<select name="s_color" class="form-control">
				<option value="0" selected>색상을 선택하여주세요</option>
				<option value="1">black</option>
				<option value="2">white</option>
				<option value="3">green</option>

			</select>
		<p>
			<button type="button" id="btn_buy" class="btn btn-success btn-lg">구매</button>
			<p>
			<a href="/itemdetail?p_idx=${product.p_idx }" class="btn btn-info btn-sm" role="button">제품 상세보기</a>
<hr>
	<script>
	$(document).on('click', '#btn_buy', function () {
		var pIdx=$('#p_idx').val(); 
		let p_idx =  pIdx;
		 let s_bank = $("select[name=s_bank]").val();
		 let s_account = $('p.sold').find('textarea.account').val();
		 let s_address = $('p.sold').find('textarea.address').val();
		 let s_size = $("select[name=s_size]").val();
		 let s_color = $("select[name=s_color]").val();
		 
		 let additem ={
				 p_idx : p_idx,
				 s_bank : s_bank,
				 s_account : s_account,
				 s_address : s_address,
				 s_size : s_size,
				 s_color : s_color
				 };
		
		 $.ajax({
			type: "post",
		 	url:"http://localhost:8080/itembuyprocess",
		 	contentType: "application/json",
		 	data: JSON.stringify(additem)
		 })
		 .done(function (data){
			 console.log(additem);
			 alert('주문완료');
		 });
	});
		
</script>
</body>
</html>