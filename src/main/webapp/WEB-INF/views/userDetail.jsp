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
<title>Insert title here</title>
</head>
<body>
	<font size="200em" color="green"> Beom shop </font>
	<hr>
	<font size="5em" color="green"> 회원 상세보기 </font>
	<p></p>
	<div id="container">
		<ul class="myMenu">
			<li class="menu1">메뉴 1</li>
			<li class="menu2">회원 관리
				<ul class="menu2_s submenu">
					<li><a href="/userList">회원 목록</a></li>


				</ul>
			</li>
			<li class="menu3">쇼핑몰관리
				<ul class="menu3_s submenu">
					<li><a href="/sales">판매 순위</a></li>
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
	<font size="4em" color="green"> 회원정보 </font>
	<hr>
	
				<p> 아이디:${user.username }</p>
				<p> 이름:${user.uName }</p>
				<p> 전화번호:${user.u_tel }</p>
				<p> 나이:${user.u_age }</p>
	<hr>
	<font size="4em" color="green"> 구매내역 </font>
	<hr>
	<table>
		<thead>
			<tr>
				<th>구매 상품명</th>
				<th>사이즈</th>
				<th>색상</th>
				
			</tr>
		</thead>
		<tbody>

			<c:forEach var="buy" items="${buyList}">
					<tr>

						<td>${buy.p_name}</td>
						<td>${buy.s_name }</td>
						<td>${buy.co_name }</td>
				</c:forEach>

		</tbody>
	</table>

</body>
</html>