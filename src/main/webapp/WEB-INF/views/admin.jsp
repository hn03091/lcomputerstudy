<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<style>
    ul, ol, li { list-style:none; margin:0; padding:0; }
   
    ul.myMenu {}
    ul.myMenu > li { display:inline-block; width:80px; padding:5px 10px; background:#FFF0F5; border:1px solid #eee; text-align:center; position:relative; }
    ul.myMenu > li:hover { background:#fff; }
    ul.myMenu > li ul.submenu { display:none; position:absolute; top:30px; left:0; }
    ul.myMenu > li:hover ul.submenu { display:block; }
    ul.myMenu > li ul.submenu > li { display:inline-block; width:80px; padding:5px 10px; background:#eee; border:1px solid #eee; text-align:center; }
    ul.myMenu > li ul.submenu > li:hover { background:#fff; }
</style> 
<title>관리자 메인</title>
</head>
<body>


<body>
<font size="200em" color="green">
<a href="/admin">Beom shop</a>
</font>

<div id="container">
<ul class="myMenu">
    <li class="menu1">메뉴 1</li>
    <li class="menu2">
        회원 관리
        <ul class="menu2_s submenu">
            <li>회원 목록</li>
            
        </ul>   
    </li>
    <li class="menu3">
        쇼핑몰관리
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

회원목록
		<!--<c:forEach var="user" items="${userList}">
			<tr>
				<td>${user.ROWNUM }</td>
				
				<td>${user.u_id}</td>
				<td>${user.u_pw }</td>
				<td>${user.name }</td>

			</tr>
		</c:forEach>!-->
<hr>
최근 구매목록
</body>
</html>

