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
<body>
	<font size="200em" color="green"> Beom shop </font>
	<hr>
	<font size="5em" color="green"> 상품 관리 </font>
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
					<li>주문 내역</li>
					<li><a href="/itemset">분류 관리</a></li>
					<li><a href="/productset">상품 관리</a></li>
				</ul>
			</li>
			<li class="menu4">메뉴 4</li>
			<li class="menu5">메뉴 5</li>
		</ul>
	</div>
<hr>

상품 목록
 <table>
      <thead>
        <tr>
          <th>대분류</th><th>중분류</th><th>상품분류코드</th><th>상품명</th><th>가격</th><th>관리</th>
        </tr>
      </thead>
      <tbody>
      		<c:forEach var="pd" items="${pdList}">
			<tr>
				<td>${pd.i_name }</td>
				<td>${pd.m_name }</td>
				<td>${pd.p_idx}</td>
				<td>${pd.p_name }</td>
				<td>${pd.p_price }원</td>
				<td>
				
				
				<form action="/productsetUpdate" method="post">
				<input type="hidden" name="p_idx" value="${pd.p_idx}">
				<button type="submit">수정</button>
				</form>
				<form action="/productsetDelete" method="post">
				<input type="hidden" name="p_idx" value="${pd.p_idx}">
				<button type="submit">삭제</button>
				</form>
				
				</td>
				

			</tr>
		</c:forEach>
		
      </tbody>
    </table>
<a href="/productwrite">상품 등록</a>


</body>
</html>