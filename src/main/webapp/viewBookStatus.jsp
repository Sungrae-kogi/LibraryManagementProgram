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
	<div class="container card align-items-center justify-content-center"
		style="width: 60%;">
		<!--  <img src="..." class="card-img-top" alt="...">	-->
		<div class="card-body p-0">
			<h5 class="card-title"><%=book.getTitle() %></h5>
			<p class="card-text">도서 상태 및 이력 조회란 현재 세션 : <%=session.getAttribute("ROLE") %></p>
			<p class="card-text">세션 상태에 따라 ADMIN이면 RENT 이력출력, 도서대출가능여부 출력</p>
			<p class="card-text">ADMIN 이외의 세션에는 RENT 이력 미출력, 도서대출가능여부 출력</p>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
				<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
				<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
				<li class="list-group-item">해당 도서의 RENT정보 출력란</li>
			</ul>
		</div>

		<div class="card-body">
			<a href="#" class="card-link">link</a> <a href="#"
				class="card-link">Another link</a>
		</div>
	</div>
</body>
</html>