<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%@ page import="java.util.List"%>

<%
	BooksVO vo = new BooksVO();

	BooksDAO bookDAO = new BooksDAO();
	List<BooksVO> bookList = null;
	
	//searchBooksProcess.jsp 에서 처리한 데이터 판별
	//로그인 시에는 attribute가 null이므로 전체 Book 데이타를 출력
	//header.jsp의 도서 검색창에서 검색한 결과를 request에 담고 forward로 넘어온 경우에는 attribute가 null이 아님
	Object attribute = request.getAttribute("searchedBookList");
	if(attribute == null){
		System.out.println("attribute is null");
		bookList = bookDAO.getBooksList();
	}else{
		System.out.println("attribute has something");
		bookList = (List<BooksVO>) request.getAttribute("searchedBookList");
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=request.getSession().getAttribute("ROLE") %>_Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
	.book_center {
		text-align: center;
	}
	
	.table {
		margin-top: 45px;
		padding-top: 45px;
	}
	
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/header.jsp" %>
	<table class="table table-striped table-hover">
		<tr>
			<th class="book_center">BOOK_ID</th>
			<th class="book_center">DUPL</th>
			<th>TITLE</th>
			<th>ISBN</th>
			<th>AUTHOR</th>
			<th class="book_center">IN_DT</th>
		</tr>
		<%for(BooksVO book : bookList) {%>
			<tr>
			<td class="book_center"><%=book.getBook_id() %></td>
			<td class="book_center"><%=book.getDupl() %></td>
			<td><%=book.getTitle() %></td>
			<td><%=book.getIsbn() %></td>
			<td><%=book.getAuthor() %></td>
			<td class="book_center"><%=book.getIn_dt() %></td>
			</tr>
		<%} %>
	</table>
	<footer> </footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>