<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>상품명 : ${product.p_name }
	<p>상품 가격: ${product.p_price }원
	<input type="hidden" id="p_idx" value="${product.p_idx }">
	<hr>

		<select name="s_bank" class="b_type">
			<option value="0" selected>입금하실 은행을 선택하여주세요</option>
			<option value="1">신한</option>
			<option value="2">농협</option>
			<option value="3">국민</option>


		</select>
		<p class="sold">
			<textarea class="account" rows="1" cols="50" name="s_account"
				placeholder="계좌번호 입력"></textarea>
		<p class="sold">
			<textarea class="address" rows="3" cols="50" name="s_address"
				placeholder="배송지 입력"></textarea>
		<hr>
		<select name="s_size" class="s_type">
			<option value="0" selected>사이즈를 선택하여주세요</option>
			<option value="1">S</option>
			<option value="2">M</option>
			<option value="3">L</option>
			<option value="4">XL</option>

		</select>
		<p>
			<select name="s_color" class="c_type">
				<option value="0" selected>색상을 선택하여주세요</option>
				<option value="1">black</option>
				<option value="2">white</option>
				<option value="3">green</option>

			</select>
		<p>
			<button type="button" id="btn_buy">구매</button>
			<a href="/itemdetail?p_idx=${product.p_idx }">돌아가기</a>
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
			 console.log(data);
			 alert('주문완료');
		 });
	});
		
</script>
</body>
</html>