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

ul.button {
	width: 400px;
	height: 50px;
	margin: 10px auto;
}

li.button {
	list-style: none;
	width: 50px;
	line-height: 50px;
	border: 1px solid #ededed;
	float: left;
	text-align: center;
	margin: 0 5px;
	border-radius: 5px;
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
					<li><a href="/userList">회원 목록</a></li>


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

상품 목록
<div>
			<form method="GET">
				<fieldset>
					<legend>글 검색</legend>
					<label>검색분류</label> <select name="type">
					
						<option value="i_name">분류명</option>
						<option value="p_name">상품명</option>
					</select> <label>검색어</label> <input type="text" name="keyword" value="" /> <input
						type="submit" value="검색">
					<%--f(제목,작성자)=title&q=(검색내용) --%>
				</fieldset>
			</form>
		</div>
 <table>
      <thead>
        <tr>
          <th>분류</th><th>상품번호</th><th>상품명</th><th>가격</th><th>관리</th>
        </tr>
      </thead>
      <tbody>
      		<c:forEach var="pd" items="${pdList}">
			<tr>
				<td>${pd.i_name }</td>
				
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
    <div>
		<ul class="button">
			<c:choose>
				<c:when test="${ page.prevPage  >=1 }">
					<li class="button" style=""><a href="/productset?nowpage=${page.prevPage}">◀</a></li>
				</c:when>
			</c:choose>

			<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}"
				step="1">
				<c:choose>
					<c:when test="${ page.nowpage == i }">

						<li class="button" style="background-color: #ededed;"><span>${i}</span></li>

					</c:when>
					<c:when test="${ page.nowpage != i }">
						<li class="button"><a href="/productset?nowpage=${i}">${i}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${ page.nextPage <= page.lastPage }">
					<li class="button" style=""><a href="/productset?nowpage=${page.nextPage}">▶</a></li>
				</c:when>
			</c:choose>
		</ul>
	</div>
    
<a href="/productwrite">상품 등록</a>


</body>
</html>