<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%@ page import="java.util.List"%>

<%
	BooksVO vo = new BooksVO();

	BooksDAO boardDAO = new BooksDAO();
	List<BooksVO> bookList = boardDAO.getBooksList();

	for (BooksVO book : bookList) {
		System.out.print("BookId : " + book.getBook_id());
		System.out.print("Dupl : " + book.getDupl());
		System.out.print("Title : " + book.getTitle());
		System.out.print("Isbn : " + book.getIsbn());
		System.out.print("Author : " + book.getAuthor());
		System.out.println("In_dt : " + book.getIn_dt());
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_Page</title>
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