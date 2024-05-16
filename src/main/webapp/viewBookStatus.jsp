<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%--선택한 도서의 조회 기능
	도서의 상태 및 이력을 조회 (대여중인지 대여가능인지, 도서의 정보, )
	
	ROLE 이 ADMIN이면 해당 BOOK_ID 에 대한 RENT 내역이 나오고 ADMIN이 아니라면 RENT 가능여부만 출력
 --%>
<%
String viewBookId = request.getParameter("bookID");
System.out.println(viewBookId);

BooksDAO dao = new BooksDAO();
BooksVO vo = new BooksVO();
vo.setBook_id(viewBookId);

BooksVO book = dao.getBook(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/header_viewBS.jsp"%>
	<div
		class="container a border align-items-center justify-content-center "
		style="width: 60%;">
		<div class="container p-0">
			<div class="row">
				<div class="col-12 border bg-light"
					style="font-size: 16px; font-weight: bold;">상세정보</div>

				<h5 class="col-12 my-1"><%=book.getTitle()%></h5>
				<hr>
				<p class="card-text">
					도서 상태 및 이력 조회란 현재 세션 :
					<%=session.getAttribute("ROLE")%></p>
				<p class="card-text">세션 상태에 따라 ADMIN이면 RENT 이력출력, 도서대출가능여부 출력</p>
				<p class="card-text">ADMIN 이외의 세션에는 RENT 이력 미출력, 도서대출가능여부 출력</p>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
					<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
					<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
					<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
				</ul>
			</div>
		</div>

	</div>
	<div class="container align-items-center justify-content-center mt-3 p-0"
		style="width: 60%;">
		<h5><strong>소장사항</strong></h5>
		<table class="table table-striped table-top-border">
			<thead>
				<tr>
					<th>도서번호</th>
					<th>복본번호</th>
					<th>제목</th>
					<th>대출가능여부</th>
					<th>반납예정일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=book.getBook_id()%></td>
					<td><%=book.getDupl()%></td>
					<td><%=book.getTitle()%></td>
					<td>Y<!-- 대출가능상태면 Y, 대출중이면 N로 --></td>
					<td>MM/DD<!-- RENT테이블의 RET_DT컬럼이 들어갈예정 --></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>