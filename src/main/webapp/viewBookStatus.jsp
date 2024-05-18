<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%--선택한 도서의 조회 기능
	도서의 상태 및 이력을 조회 (대여중인지 대여가능인지, 도서의 정보, )
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
<title>도서 상세 정보 : <%=book.getTitle() %></title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/header_viewBS.jsp"%>
	<div
		class="container a border align-items-center justify-content-center "
		style="width: 60%;">

		<div class="row">
			<div class="col-12 border bg-light"
				style="font-size: 16px; font-weight: bold;">상세정보</div>

			<h5 class="col-12 my-1"><%=book.getTitle()%></h5>
			<hr>
			<div class="row p-2">
				<div class="text-end col-3">도서 번호 :</div>
				<div class="col-9"><%=book.getBook_id()%></div>
			</div>
			<div class="row p-2">
				<div class="text-end col-3">제목 :</div>
				<div class="col-9"><%=book.getTitle() %></div>
			</div>
			<div class="row p-2">
				<div class="text-end col-3">ISBN :</div>
				<div class="col-9"><%=book.getIsbn() %></div>
			</div>
			<div class="row p-2">
				<div class="text-end col-3">저자 :</div>
				<div class="col-9"><%=book.getAuthor() %></div>
			</div>
			<div class="row p-2">
				<div class="text-end col-3">수서일 :</div>
				<div class="col-9"><%=book.getIn_dt() %></div>
			</div>
			<div class="row p-2">
				<div class="text-end col-3">복본번호 :</div>
				<div class="col-9"><%=book.getDupl() %></div>
			</div>
			
			
			<ul class="list-group list-group-flush">
				<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
				<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
				<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
				<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
			</ul>
		</div>

	</div>
	<div class="container align-items-center justify-content-center mt-3 p-0"
		style="width: 60%;">
		<h5>
			<strong>소장사항</strong>
		</h5>
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
	
	<%--세션의 ROLE 값이 ADMIN이면 해당 BOOK_ID 에 대한 RENT 내역이 나오고 ADMIN이 아니라면 RENT내역 불필요--%>
	<%
		String userRole = (String) request.getSession().getAttribute("ROLE"); 
		
	%>
	<div class="container align-items-center justify-content-center mt-3 p-0"
		style="width: 60%;">
		<h5>
			<strong>대출이력</strong>
		</h5>
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