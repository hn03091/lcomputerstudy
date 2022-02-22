<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<style>

 table {
    width: 70%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
ul, ol, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

ul.myMenu {
	
}

ul.myMenu>li {
	display: inline-block;
	width: 80px;
	padding: 5px 10px;
	background: #FFF0F5;
	border: 1px solid #eee;
	text-align: center;
	position: relative;
}

ul.myMenu>li:hover {
	background: #fff;
}

ul.myMenu>li ul.submenu {
	display: none;
	position: absolute;
	top: 30px;
	left: 0;
}

ul.myMenu>li:hover ul.submenu {
	display: block;
}

ul.myMenu>li ul.submenu>li {
	display: inline-block;
	width: 80px;
	padding: 5px 10px;
	background: #eee;
	border: 1px solid #eee;
	text-align: center;
}

ul.myMenu>li ul.submenu>li:hover {
	background: #fff;
}
</style>
<title>관리자 메인</title>
</head>
<body>
	<font size="200em" color="green"> Beom shop </font>
	<hr>
	<font size="5em" color="green"> 분류 관리 </font>
	<p></p>
	<div id="container">
		<ul class="myMenu">
			<li class="menu1">메뉴 1</li>
			<li class="menu2">회원 관리
				<ul class="menu2_s submenu">
					<li>회원 목록</li>

				</ul>
			</li>
			<li class="menu3">쇼핑몰관리
				<ul class="menu3_s submenu">
					<li><a href="/soldList">주문 내역</a></li>
					<li><a href="/itemset">분류 관리</a></li>
					<li><a href="/productset">상품 관리</a></li>
				</ul>
			</li>
			<li class="menu4">메뉴 4</li>
			<li class="menu5">메뉴 5</li>
		</ul>
	</div>
<hr>
<div style="OVERFLOW-Y:auto; width:100%; height:500px;">
 <table>

      <thead>
      
        <tr>
          <th>번호</th>
          <th>상품명</th>
          <th>사이즈</th>
          <th>색상</th>
          <th>배송지</th>
          <th>입금 계좌</th>
          <th>입금 은행</th>
          <th>주문 고객ID</th>
          
        </tr>
      </thead>
      <tbody>
      		<c:forEach var="sold" items="${soldList}">
			<tr>
				
				<td>${sold.s_idx}</td>
				<td>${sold.p_name }</td>
				<td>${sold.s_name }</td>
				<td>${sold.co_name }</td>
				<td>${sold.s_address }</td>
				<td>${sold.s_account }</td>
				<td>${sold.b_name }</td>
				<td><a href="/userdetail?uId=${sold.u_id}">${sold.u_id }</a></td>
				
				

			</tr>
		</c:forEach>
		
      </tbody>
      
    </table>
</div>
<p>
<hr>
<p>


</body>
</html>